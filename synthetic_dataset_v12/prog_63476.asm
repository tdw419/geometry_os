; DESCRIPTION: Composite: Places a magenta 106x54 rectangle at position (59, 37) then Places a purple circle of radius 15 at center (138, 112) then Draws a green line from (387, 194) to (222, 196).
; PLAN: r0=59(x), r1=37(y), r2=106(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=138(x), r6=112(y), r7=15(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=387(x1), r11=194(y1), r12=222(x2), r13=196(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 37
LDI r2, 106
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 112
LDI r7, 15
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 387
LDI r11, 194
LDI r12, 222
LDI r13, 196
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
