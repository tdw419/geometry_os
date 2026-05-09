; DESCRIPTION: Composite: Draws a blue rectangle at (419, 151) with width 32 and height 26 then Renders a cyan disk with center (484, 72) and radius 12 then Draws a orange line from (264, 141) to (305, 69).
; PLAN: r0=419(x), r1=151(y), r2=32(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=484(x), r6=72(y), r7=12(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=264(x1), r11=141(y1), r12=305(x2), r13=69(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 151
LDI r2, 32
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 72
LDI r7, 12
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 264
LDI r11, 141
LDI r12, 305
LDI r13, 69
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
