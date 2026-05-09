; DESCRIPTION: Renders a blue box of size 79x53 starting at (156, 112).
; PLAN: r0=156(x), r1=112(y), r2=79(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 112
LDI r2, 79
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
