; DESCRIPTION: Renders a magenta box of size 37x112 starting at (211, 41).
; PLAN: r0=211(x), r1=41(y), r2=37(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 41
LDI r2, 37
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
