; DESCRIPTION: Renders a red box of size 54x118 starting at (272, 77).
; PLAN: r0=272(x), r1=77(y), r2=54(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 77
LDI r2, 54
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
