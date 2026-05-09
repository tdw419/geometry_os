; DESCRIPTION: Composite: Renders a red box of size 31x105 starting at (88, 90) then Places a white line segment connecting (196, 161) to (196, 96) then Places a yellow dot at position (2, 198).
; PLAN: r0=88(x), r1=90(y), r2=31(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=196(x1), r6=161(y1), r7=196(x2), r8=96(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=2(x), r11=198(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 88
LDI r1, 90
LDI r2, 31
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 161
LDI r7, 196
LDI r8, 96
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 2
LDI r11, 198
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
