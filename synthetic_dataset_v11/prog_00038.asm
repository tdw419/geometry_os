; DESCRIPTION: Renders a blue box of size 74x113 starting at (88, 125).
; PLAN: r0=88(x), r1=125(y), r2=74(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 125
LDI r2, 74
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
