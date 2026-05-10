; DESCRIPTION: Creates a magenta filled rectangle of size 50x63 starting at (181, 41).
; PLAN: r0=181(x), r1=41(y), r2=50(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 41
LDI r2, 50
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
