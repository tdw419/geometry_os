; DESCRIPTION: Renders a red box of size 74x117 starting at (103, 52).
; PLAN: r0=103(x), r1=52(y), r2=74(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 52
LDI r2, 74
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
