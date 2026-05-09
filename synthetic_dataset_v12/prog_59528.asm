; DESCRIPTION: Composite: Draws a black rectangle at (236, 141) with width 68 and height 74 then Renders a cyan disk with center (190, 154) and radius 33 then Places a blue line segment connecting (511, 196) to (81, 218).
; PLAN: r0=236(x), r1=141(y), r2=68(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x), r6=154(y), r7=33(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=511(x1), r11=196(y1), r12=81(x2), r13=218(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 141
LDI r2, 68
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 154
LDI r7, 33
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 511
LDI r11, 196
LDI r12, 81
LDI r13, 218
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
