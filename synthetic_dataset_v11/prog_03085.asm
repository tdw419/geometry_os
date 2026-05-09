; DESCRIPTION: Renders a red box of size 81x89 starting at (60, 68).
; PLAN: r0=60(x), r1=68(y), r2=81(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 68
LDI r2, 81
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
