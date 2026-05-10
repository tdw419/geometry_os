; DESCRIPTION: Renders a magenta box of size 11x41 starting at (6, 171).
; PLAN: r0=6(x), r1=171(y), r2=11(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 171
LDI r2, 11
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
