; DESCRIPTION: Renders a blue box of size 102x108 starting at (52, 113).
; PLAN: r0=52(x), r1=113(y), r2=102(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 113
LDI r2, 102
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
