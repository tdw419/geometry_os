; DESCRIPTION: Renders a blue box of size 12x14 starting at (113, 29).
; PLAN: r0=113(x), r1=29(y), r2=12(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 29
LDI r2, 12
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
