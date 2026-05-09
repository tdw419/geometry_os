; DESCRIPTION: Composite: Places a purple circle of radius 70 at center (149, 162) then Places a black 36x36 rectangle at position (67, 112) then Draws a cyan line from (176, 237) to (286, 184).
; PLAN: r0=149(x), r1=162(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=67(x), r6=112(y), r7=36(width), r8=36(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=176(x1), r11=237(y1), r12=286(x2), r13=184(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 149
LDI r1, 162
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 67
LDI r6, 112
LDI r7, 36
LDI r8, 36
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 237
LDI r12, 286
LDI r13, 184
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
