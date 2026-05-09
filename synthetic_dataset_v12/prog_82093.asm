; DESCRIPTION: Places a black 66x48 rectangle at position (102, 9).
; PLAN: r0=102(x), r1=9(y), r2=66(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 9
LDI r2, 66
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
