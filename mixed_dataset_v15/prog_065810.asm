; DESCRIPTION: Composite: Places a cyan dot at position (223, 80) then Renders a red disk with center (264, 89) and radius 76 then Draws a purple line from (52, 180) to (220, 222).
; PLAN: r0=223(x), r1=80(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=264(x), r6=89(y), r7=76(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=52(x1), r11=180(y1), r12=220(x2), r13=222(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 223
LDI r1, 80
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 264
LDI r6, 89
LDI r7, 76
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 52
LDI r11, 180
LDI r12, 220
LDI r13, 222
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
