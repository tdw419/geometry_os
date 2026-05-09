; DESCRIPTION: Composite: Renders a black box of size 18x119 starting at (478, 27) then Renders a purple line between points (470, 11) and (280, 94).
; PLAN: r0=478(x), r1=27(y), r2=18(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=470(x1), r6=11(y1), r7=280(x2), r8=94(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 478
LDI r1, 27
LDI r2, 18
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 11
LDI r7, 280
LDI r8, 94
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
