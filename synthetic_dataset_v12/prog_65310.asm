; DESCRIPTION: Renders a blue box of size 12x67 starting at (194, 125).
; PLAN: r0=194(x), r1=125(y), r2=12(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 125
LDI r2, 12
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
