; DESCRIPTION: Renders a red box of size 118x21 starting at (106, 25).
; PLAN: r0=106(x), r1=25(y), r2=118(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 25
LDI r2, 118
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
