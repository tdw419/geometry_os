; DESCRIPTION: Renders a red box of size 58x27 starting at (407, 110).
; PLAN: r0=407(x), r1=110(y), r2=58(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 110
LDI r2, 58
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
