; DESCRIPTION: Renders a red box of size 23x86 starting at (485, 127).
; PLAN: r0=485(x), r1=127(y), r2=23(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 127
LDI r2, 23
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
