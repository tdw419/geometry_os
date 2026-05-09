; DESCRIPTION: Composite: Renders a white box of size 36x81 starting at (104, 139) then Renders a magenta disk with center (447, 134) and radius 52 then Places a cyan line segment connecting (157, 120) to (218, 230).
; PLAN: r0=104(x), r1=139(y), r2=36(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=447(x), r6=134(y), r7=52(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=157(x1), r11=120(y1), r12=218(x2), r13=230(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 139
LDI r2, 36
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 134
LDI r7, 52
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 157
LDI r11, 120
LDI r12, 218
LDI r13, 230
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
