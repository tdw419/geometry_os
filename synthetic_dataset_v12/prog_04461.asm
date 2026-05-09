; DESCRIPTION: Renders a blue box of size 25x64 starting at (159, 43).
; PLAN: r0=159(x), r1=43(y), r2=25(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 43
LDI r2, 25
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
