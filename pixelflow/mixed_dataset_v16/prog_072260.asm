; DESCRIPTION: Places a black 79x107 rectangle at position (88, 19).
; PLAN: r0=88(x), r1=19(y), r2=79(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 19
LDI r2, 79
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
