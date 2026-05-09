; DESCRIPTION: Renders a red box of size 23x58 starting at (84, 27).
; PLAN: r0=84(x), r1=27(y), r2=23(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 27
LDI r2, 23
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
