; DESCRIPTION: Renders a red box of size 77x29 starting at (162, 178).
; PLAN: r0=162(x), r1=178(y), r2=77(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 178
LDI r2, 77
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
