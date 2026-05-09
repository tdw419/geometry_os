; DESCRIPTION: Places a black 82x79 rectangle at position (78, 24).
; PLAN: r0=78(x), r1=24(y), r2=82(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 24
LDI r2, 82
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
