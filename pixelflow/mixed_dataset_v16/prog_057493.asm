; DESCRIPTION: Renders a red box of size 81x92 starting at (406, 162).
; PLAN: r0=406(x), r1=162(y), r2=81(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 162
LDI r2, 81
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
