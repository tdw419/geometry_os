; DESCRIPTION: Renders a red box of size 27x33 starting at (162, 169).
; PLAN: r0=162(x), r1=169(y), r2=27(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 169
LDI r2, 27
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
