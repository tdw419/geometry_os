; DESCRIPTION: Places a black 49x100 rectangle at position (171, 156).
; PLAN: r0=171(x), r1=156(y), r2=49(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 156
LDI r2, 49
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
