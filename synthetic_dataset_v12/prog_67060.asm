; DESCRIPTION: Renders a green box of size 116x36 starting at (226, 106).
; PLAN: r0=226(x), r1=106(y), r2=116(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 106
LDI r2, 116
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
