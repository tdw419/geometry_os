; DESCRIPTION: Places a black 31x102 rectangle at position (45, 19).
; PLAN: r0=45(x), r1=19(y), r2=31(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 19
LDI r2, 31
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
