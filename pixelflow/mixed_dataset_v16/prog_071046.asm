; DESCRIPTION: Composite: Places a white 52x14 rectangle at position (123, 36) then Creates a purple circular shape at (401, 141) with radius 79.
; PLAN: r0=123(x), r1=36(y), r2=52(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x), r6=141(y), r7=79(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 123
LDI r1, 36
LDI r2, 52
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 141
LDI r7, 79
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
