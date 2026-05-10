; DESCRIPTION: Places a black 112x101 rectangle at position (5, 125).
; PLAN: r0=5(x), r1=125(y), r2=112(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 125
LDI r2, 112
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
