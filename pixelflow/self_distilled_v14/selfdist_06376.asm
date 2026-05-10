; DESCRIPTION: Creates a red filled rectangle of size 11x96 starting at (50, 127).
; PLAN: r0=50(x), r1=127(y), r2=11(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 127
LDI r2, 11
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
