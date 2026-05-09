; DESCRIPTION: Renders a red box of size 73x27 starting at (14, 175).
; PLAN: r0=14(x), r1=175(y), r2=73(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 175
LDI r2, 73
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
