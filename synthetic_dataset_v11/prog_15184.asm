; DESCRIPTION: Renders a green box of size 106x53 starting at (56, 100).
; PLAN: r0=56(x), r1=100(y), r2=106(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 100
LDI r2, 106
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
