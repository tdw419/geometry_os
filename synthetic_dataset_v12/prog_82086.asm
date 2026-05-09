; DESCRIPTION: Places a black 109x66 rectangle at position (117, 52).
; PLAN: r0=117(x), r1=52(y), r2=109(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 52
LDI r2, 109
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
