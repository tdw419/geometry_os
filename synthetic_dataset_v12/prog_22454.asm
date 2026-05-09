; DESCRIPTION: Places a black 104x104 rectangle at position (232, 116).
; PLAN: r0=232(x), r1=116(y), r2=104(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 116
LDI r2, 104
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
