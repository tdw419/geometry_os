; DESCRIPTION: Renders a green box of size 88x117 starting at (39, 102).
; PLAN: r0=39(x), r1=102(y), r2=88(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 102
LDI r2, 88
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
