; DESCRIPTION: Composite: Places a blue 60x56 rectangle at position (96, 126) then Renders a white disk with center (262, 180) and radius 58 then Draws a white line from (355, 88) to (286, 151).
; PLAN: r0=96(x), r1=126(y), r2=60(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=262(x), r6=180(y), r7=58(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=355(x1), r11=88(y1), r12=286(x2), r13=151(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 126
LDI r2, 60
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 180
LDI r7, 58
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 355
LDI r11, 88
LDI r12, 286
LDI r13, 151
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
