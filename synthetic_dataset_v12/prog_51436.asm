; DESCRIPTION: Renders a magenta box of size 83x41 starting at (310, 191).
; PLAN: r0=310(x), r1=191(y), r2=83(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 191
LDI r2, 83
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
