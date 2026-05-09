; DESCRIPTION: Places a black 116x23 rectangle at position (193, 218).
; PLAN: r0=193(x), r1=218(y), r2=116(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 218
LDI r2, 116
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
