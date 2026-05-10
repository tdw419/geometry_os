; DESCRIPTION: Composite: Renders a white disk with center (251, 80) and radius 21 then Draws a white line from (150, 252) to (326, 86) then Places a red dot at position (306, 22).
; PLAN: r0=251(x), r1=80(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x1), r6=252(y1), r7=326(x2), r8=86(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=306(x), r11=22(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 251
LDI r1, 80
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 252
LDI r7, 326
LDI r8, 86
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 22
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
