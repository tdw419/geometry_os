; DESCRIPTION: Places a black 110x104 rectangle at position (393, 116).
; PLAN: r0=393(x), r1=116(y), r2=110(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 116
LDI r2, 110
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
