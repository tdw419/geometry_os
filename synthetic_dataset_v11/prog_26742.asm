; DESCRIPTION: Renders a blue box of size 113x61 starting at (34, 156).
; PLAN: r0=34(x), r1=156(y), r2=113(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 156
LDI r2, 113
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
