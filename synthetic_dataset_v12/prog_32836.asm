; DESCRIPTION: Renders a blue box of size 53x64 starting at (43, 40).
; PLAN: r0=43(x), r1=40(y), r2=53(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 40
LDI r2, 53
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
