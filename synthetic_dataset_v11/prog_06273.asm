; DESCRIPTION: Renders a blue box of size 76x77 starting at (14, 176).
; PLAN: r0=14(x), r1=176(y), r2=76(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 176
LDI r2, 76
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
