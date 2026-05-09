; DESCRIPTION: Renders a blue box of size 111x91 starting at (113, 101).
; PLAN: r0=113(x), r1=101(y), r2=111(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 101
LDI r2, 111
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
