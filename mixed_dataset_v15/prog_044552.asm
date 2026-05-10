; DESCRIPTION: Composite: Renders a orange box of size 57x30 starting at (182, 12) then Places a green line segment connecting (14, 126) to (52, 121) then Places a blue dot at position (264, 254).
; PLAN: r0=182(x), r1=12(y), r2=57(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=14(x1), r6=126(y1), r7=52(x2), r8=121(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=264(x), r11=254(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 182
LDI r1, 12
LDI r2, 57
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 126
LDI r7, 52
LDI r8, 121
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 264
LDI r11, 254
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
