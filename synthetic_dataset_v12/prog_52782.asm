; DESCRIPTION: Composite: Places a blue line segment connecting (262, 167) to (183, 109) then Places a green dot at position (148, 247) then Draws a red rectangle at (293, 128) with width 108 and height 87.
; PLAN: r0=262(x1), r1=167(y1), r2=183(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=247(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=293(x), r11=128(y), r12=108(width), r13=87(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 167
LDI r2, 183
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 247
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 293
LDI r11, 128
LDI r12, 108
LDI r13, 87
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
