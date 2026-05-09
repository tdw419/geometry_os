; DESCRIPTION: Renders a red box of size 90x115 starting at (119, 118).
; PLAN: r0=119(x), r1=118(y), r2=90(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 118
LDI r2, 90
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
