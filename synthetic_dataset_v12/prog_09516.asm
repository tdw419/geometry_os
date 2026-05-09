; DESCRIPTION: Composite: Renders a blue line between points (113, 43) and (352, 211) then Creates a blue circular shape at (55, 128) with radius 19 then Places a cyan 110x27 rectangle at position (342, 168).
; PLAN: r0=113(x1), r1=43(y1), r2=352(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=55(x), r6=128(y), r7=19(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=342(x), r11=168(y), r12=110(width), r13=27(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 43
LDI r2, 352
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 128
LDI r7, 19
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 342
LDI r11, 168
LDI r12, 110
LDI r13, 27
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
