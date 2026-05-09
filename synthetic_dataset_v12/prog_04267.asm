; DESCRIPTION: Composite: Places a black circle of radius 79 at center (293, 97) then Renders a blue line between points (120, 92) and (198, 119) then Places a yellow 99x105 rectangle at position (63, 133).
; PLAN: r0=293(x), r1=97(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x1), r6=92(y1), r7=198(x2), r8=119(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=63(x), r11=133(y), r12=99(width), r13=105(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 293
LDI r1, 97
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 92
LDI r7, 198
LDI r8, 119
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 63
LDI r11, 133
LDI r12, 99
LDI r13, 105
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
