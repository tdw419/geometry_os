; DESCRIPTION: Places a black 114x60 rectangle at position (24, 191).
; PLAN: r0=24(x), r1=191(y), r2=114(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 191
LDI r2, 114
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
