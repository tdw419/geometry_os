; DESCRIPTION: Places a red 19x36 rectangle at position (247, 30).
; PLAN: r0=247(x), r1=30(y), r2=19(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 30
LDI r2, 19
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
