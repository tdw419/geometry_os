; DESCRIPTION: Composite: Renders a blue box of size 86x76 starting at (167, 177) then Draws a green line from (385, 254) to (186, 35) then Draws a cyan circle centered at (252, 148) with radius 74.
; PLAN: r0=167(x), r1=177(y), r2=86(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x1), r6=254(y1), r7=186(x2), r8=35(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=252(x), r11=148(y), r12=74(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 167
LDI r1, 177
LDI r2, 86
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 254
LDI r7, 186
LDI r8, 35
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 252
LDI r11, 148
LDI r12, 74
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
