; DESCRIPTION: Places a black 21x22 rectangle at position (138, 194).
; PLAN: r0=138(x), r1=194(y), r2=21(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 194
LDI r2, 21
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
