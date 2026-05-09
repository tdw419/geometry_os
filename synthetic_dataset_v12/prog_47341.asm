; DESCRIPTION: Composite: Creates a purple circular shape at (179, 201) with radius 32 then Places a purple 80x103 rectangle at position (235, 38) then Draws a cyan line from (384, 191) to (39, 69).
; PLAN: r0=179(x), r1=201(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x), r6=38(y), r7=80(width), r8=103(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=384(x1), r11=191(y1), r12=39(x2), r13=69(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 201
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 38
LDI r7, 80
LDI r8, 103
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 384
LDI r11, 191
LDI r12, 39
LDI r13, 69
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
