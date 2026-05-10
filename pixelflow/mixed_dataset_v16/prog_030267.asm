; DESCRIPTION: Places a black 24x66 rectangle at position (408, 81).
; PLAN: r0=408(x), r1=81(y), r2=24(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 81
LDI r2, 24
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
