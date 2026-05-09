; DESCRIPTION: Renders a green box of size 12x77 starting at (457, 122).
; PLAN: r0=457(x), r1=122(y), r2=12(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 122
LDI r2, 12
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
