; DESCRIPTION: Renders a green box of size 19x34 starting at (134, 153).
; PLAN: r0=134(x), r1=153(y), r2=19(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 153
LDI r2, 19
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
