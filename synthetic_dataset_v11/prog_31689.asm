; DESCRIPTION: Renders a red box of size 118x29 starting at (97, 161).
; PLAN: r0=97(x), r1=161(y), r2=118(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 161
LDI r2, 118
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
