; DESCRIPTION: Renders a red box of size 106x27 starting at (141, 222).
; PLAN: r0=141(x), r1=222(y), r2=106(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 222
LDI r2, 106
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
