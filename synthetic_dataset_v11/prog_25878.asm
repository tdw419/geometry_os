; DESCRIPTION: Places a black 102x101 rectangle at position (140, 103).
; PLAN: r0=140(x), r1=103(y), r2=102(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 103
LDI r2, 102
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
