; DESCRIPTION: Composite: Places a cyan line segment connecting (69, 69) to (459, 15) then Renders a red box of size 24x14 starting at (241, 119) then Places a magenta circle of radius 63 at center (270, 119).
; PLAN: r0=69(x1), r1=69(y1), r2=459(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=119(y), r7=24(width), r8=14(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=270(x), r11=119(y), r12=63(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 69
LDI r1, 69
LDI r2, 459
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 119
LDI r7, 24
LDI r8, 14
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 119
LDI r12, 63
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
