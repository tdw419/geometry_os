; DESCRIPTION: Renders a blue box of size 49x116 starting at (255, 0).
; PLAN: r0=255(x), r1=0(y), r2=49(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 0
LDI r2, 49
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
