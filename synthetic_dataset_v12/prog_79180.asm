; DESCRIPTION: Renders a yellow box of size 27x78 starting at (485, 4).
; PLAN: r0=485(x), r1=4(y), r2=27(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 4
LDI r2, 27
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
