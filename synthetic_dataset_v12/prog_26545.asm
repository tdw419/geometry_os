; DESCRIPTION: Renders a blue box of size 32x71 starting at (34, 59).
; PLAN: r0=34(x), r1=59(y), r2=32(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 59
LDI r2, 32
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
