; DESCRIPTION: Composite: Places a orange line segment connecting (118, 135) to (217, 36) then Renders a purple box of size 14x37 starting at (252, 106) then Places a cyan dot at position (226, 200).
; PLAN: r0=118(x1), r1=135(y1), r2=217(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=252(x), r6=106(y), r7=14(width), r8=37(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=226(x), r11=200(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 118
LDI r1, 135
LDI r2, 217
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 106
LDI r7, 14
LDI r8, 37
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 226
LDI r11, 200
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
