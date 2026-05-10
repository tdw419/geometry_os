; DESCRIPTION: Renders a red box of size 23x68 starting at (430, 31).
; PLAN: r0=430(x), r1=31(y), r2=23(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 31
LDI r2, 23
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
