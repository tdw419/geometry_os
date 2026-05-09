; DESCRIPTION: Renders a magenta box of size 64x97 starting at (130, 41).
; PLAN: r0=130(x), r1=41(y), r2=64(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 41
LDI r2, 64
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
