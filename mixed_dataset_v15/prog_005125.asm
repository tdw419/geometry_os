; DESCRIPTION: Renders a magenta box of size 26x49 starting at (435, 96).
; PLAN: r0=435(x), r1=96(y), r2=26(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 96
LDI r2, 26
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
