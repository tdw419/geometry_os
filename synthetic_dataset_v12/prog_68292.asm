; DESCRIPTION: Composite: Renders a blue box of size 40x35 starting at (247, 171) then Renders a purple line between points (325, 86) and (3, 9) then Sets a single cyan pixel at (344, 20).
; PLAN: r0=247(x), r1=171(y), r2=40(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=325(x1), r6=86(y1), r7=3(x2), r8=9(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=344(x), r11=20(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 247
LDI r1, 171
LDI r2, 40
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 86
LDI r7, 3
LDI r8, 9
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 20
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
