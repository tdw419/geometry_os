; DESCRIPTION: Creates a red filled rectangle of size 69x51 starting at (246, 10).
; PLAN: r0=246(x), r1=10(y), r2=69(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 10
LDI r2, 69
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
