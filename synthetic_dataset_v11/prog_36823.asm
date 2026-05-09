; DESCRIPTION: Renders a red box of size 25x68 starting at (162, 74).
; PLAN: r0=162(x), r1=74(y), r2=25(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 74
LDI r2, 25
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
