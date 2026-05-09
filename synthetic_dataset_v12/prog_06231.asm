; DESCRIPTION: Places a black 116x104 rectangle at position (177, 141).
; PLAN: r0=177(x), r1=141(y), r2=116(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 141
LDI r2, 116
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
