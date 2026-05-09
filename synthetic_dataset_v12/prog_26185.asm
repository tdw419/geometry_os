; DESCRIPTION: Renders a red box of size 22x26 starting at (132, 165).
; PLAN: r0=132(x), r1=165(y), r2=22(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 165
LDI r2, 22
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
