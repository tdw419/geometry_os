; DESCRIPTION: Renders a green box of size 23x99 starting at (194, 1).
; PLAN: r0=194(x), r1=1(y), r2=23(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 1
LDI r2, 23
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
