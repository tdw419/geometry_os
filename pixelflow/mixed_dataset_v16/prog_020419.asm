; DESCRIPTION: Renders a black box of size 57x80 starting at (252, 118).
; PLAN: r0=252(x), r1=118(y), r2=57(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 118
LDI r2, 57
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
