; DESCRIPTION: Renders a blue box of size 49x64 starting at (320, 106).
; PLAN: r0=320(x), r1=106(y), r2=49(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 106
LDI r2, 49
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
