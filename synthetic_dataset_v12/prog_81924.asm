; DESCRIPTION: Places a black 98x112 rectangle at position (79, 90).
; PLAN: r0=79(x), r1=90(y), r2=98(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 90
LDI r2, 98
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
