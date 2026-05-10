; DESCRIPTION: Composite: Draws a red circle centered at (242, 33) with radius 24 then Places a magenta 117x81 rectangle at position (247, 64) then Places a black line segment connecting (282, 85) to (345, 37).
; PLAN: r0=242(x), r1=33(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=247(x), r6=64(y), r7=117(width), r8=81(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=282(x1), r11=85(y1), r12=345(x2), r13=37(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 242
LDI r1, 33
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 247
LDI r6, 64
LDI r7, 117
LDI r8, 81
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 282
LDI r11, 85
LDI r12, 345
LDI r13, 37
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
