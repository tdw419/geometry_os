; DESCRIPTION: Renders a blue box of size 116x74 starting at (123, 135).
; PLAN: r0=123(x), r1=135(y), r2=116(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 135
LDI r2, 116
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
