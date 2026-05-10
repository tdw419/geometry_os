; DESCRIPTION: Renders a red box of size 99x13 starting at (140, 0).
; PLAN: r0=140(x), r1=0(y), r2=99(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 0
LDI r2, 99
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
