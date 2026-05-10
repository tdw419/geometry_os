; DESCRIPTION: Renders a red box of size 118x79 starting at (107, 169).
; PLAN: r0=107(x), r1=169(y), r2=118(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 169
LDI r2, 118
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
