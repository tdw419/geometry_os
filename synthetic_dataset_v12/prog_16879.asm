; DESCRIPTION: Composite: Creates a blue circular shape at (182, 78) with radius 50 then Places a blue line segment connecting (283, 129) to (371, 212) then Renders a red box of size 63x101 starting at (440, 16).
; PLAN: r0=182(x), r1=78(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x1), r6=129(y1), r7=371(x2), r8=212(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=440(x), r11=16(y), r12=63(width), r13=101(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 78
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 129
LDI r7, 371
LDI r8, 212
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 440
LDI r11, 16
LDI r12, 63
LDI r13, 101
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
