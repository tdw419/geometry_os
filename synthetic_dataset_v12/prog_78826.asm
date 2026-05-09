; DESCRIPTION: Places a black 96x107 rectangle at position (79, 40).
; PLAN: r0=79(x), r1=40(y), r2=96(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 40
LDI r2, 96
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
