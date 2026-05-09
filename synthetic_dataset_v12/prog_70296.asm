; DESCRIPTION: Renders a magenta box of size 40x77 starting at (252, 122).
; PLAN: r0=252(x), r1=122(y), r2=40(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 122
LDI r2, 40
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
