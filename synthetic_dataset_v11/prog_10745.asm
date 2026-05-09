; DESCRIPTION: Places a yellow 30x118 rectangle at position (189, 24).
; PLAN: r0=189(x), r1=24(y), r2=30(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 24
LDI r2, 30
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
