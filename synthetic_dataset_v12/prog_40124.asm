; DESCRIPTION: Renders a red box of size 91x27 starting at (15, 194).
; PLAN: r0=15(x), r1=194(y), r2=91(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 194
LDI r2, 91
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
