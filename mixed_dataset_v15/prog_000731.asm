; DESCRIPTION: Composite: Places a purple dot at position (354, 48) then Draws a red line from (298, 170) to (470, 157) then Renders a cyan disk with center (353, 45) and radius 30.
; PLAN: r0=354(x), r1=48(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=298(x1), r6=170(y1), r7=470(x2), r8=157(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=353(x), r11=45(y), r12=30(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 354
LDI r1, 48
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 298
LDI r6, 170
LDI r7, 470
LDI r8, 157
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 45
LDI r12, 30
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
