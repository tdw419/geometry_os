; DESCRIPTION: Renders a magenta box of size 97x41 starting at (329, 12).
; PLAN: r0=329(x), r1=12(y), r2=97(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 12
LDI r2, 97
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
