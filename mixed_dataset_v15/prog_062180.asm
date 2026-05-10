; DESCRIPTION: Renders a magenta box of size 41x41 starting at (82, 72).
; PLAN: r0=82(x), r1=72(y), r2=41(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 72
LDI r2, 41
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
