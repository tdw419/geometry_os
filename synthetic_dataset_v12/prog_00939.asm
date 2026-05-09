; DESCRIPTION: Places a black 113x87 rectangle at position (282, 114).
; PLAN: r0=282(x), r1=114(y), r2=113(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 114
LDI r2, 113
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
