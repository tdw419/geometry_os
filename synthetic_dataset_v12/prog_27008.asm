; DESCRIPTION: Places a black 62x115 rectangle at position (118, 103).
; PLAN: r0=118(x), r1=103(y), r2=62(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 103
LDI r2, 62
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
