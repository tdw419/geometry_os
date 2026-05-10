; DESCRIPTION: Composite: Places a blue circle of radius 71 at center (213, 116) then Places a black 92x108 rectangle at position (59, 36) then Renders a yellow line between points (254, 66) and (472, 90).
; PLAN: r0=213(x), r1=116(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=59(x), r6=36(y), r7=92(width), r8=108(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=254(x1), r11=66(y1), r12=472(x2), r13=90(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 116
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 59
LDI r6, 36
LDI r7, 92
LDI r8, 108
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 254
LDI r11, 66
LDI r12, 472
LDI r13, 90
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
