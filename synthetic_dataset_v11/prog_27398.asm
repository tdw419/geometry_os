; DESCRIPTION: Renders a blue box of size 64x11 starting at (117, 159).
; PLAN: r0=117(x), r1=159(y), r2=64(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 159
LDI r2, 64
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
