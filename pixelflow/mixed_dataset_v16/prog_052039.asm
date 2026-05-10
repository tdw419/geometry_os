; DESCRIPTION: Composite: Sets a single blue pixel at (89, 124) then Places a orange line segment connecting (503, 96) to (201, 149) then Creates a blue rectangular region at (101, 32) spanning 47 by 117 pixels.
; PLAN: r0=89(x), r1=124(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=503(x1), r6=96(y1), r7=201(x2), r8=149(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=101(x), r11=32(y), r12=47(width), r13=117(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 124
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 503
LDI r6, 96
LDI r7, 201
LDI r8, 149
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 32
LDI r12, 47
LDI r13, 117
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
