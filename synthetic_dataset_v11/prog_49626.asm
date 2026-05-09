; DESCRIPTION: Renders a magenta box of size 50x41 starting at (49, 157).
; PLAN: r0=49(x), r1=157(y), r2=50(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 157
LDI r2, 50
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
