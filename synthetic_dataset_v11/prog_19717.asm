; DESCRIPTION: Places a red 19x43 rectangle at position (2, 136).
; PLAN: r0=2(x), r1=136(y), r2=19(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 136
LDI r2, 19
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
