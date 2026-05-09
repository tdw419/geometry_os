; DESCRIPTION: Renders a blue box of size 112x120 starting at (61, 73).
; PLAN: r0=61(x), r1=73(y), r2=112(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 73
LDI r2, 112
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
