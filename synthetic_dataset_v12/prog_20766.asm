; DESCRIPTION: Places a red 61x101 rectangle at position (382, 26).
; PLAN: r0=382(x), r1=26(y), r2=61(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 26
LDI r2, 61
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
