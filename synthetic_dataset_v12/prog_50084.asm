; DESCRIPTION: Composite: Renders a blue line between points (78, 35) and (131, 128) then Draws a white circle centered at (480, 26) with radius 26 then Renders a red box of size 48x86 starting at (274, 32).
; PLAN: r0=78(x1), r1=35(y1), r2=131(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=480(x), r6=26(y), r7=26(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=274(x), r11=32(y), r12=48(width), r13=86(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 35
LDI r2, 131
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 26
LDI r7, 26
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 274
LDI r11, 32
LDI r12, 48
LDI r13, 86
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
