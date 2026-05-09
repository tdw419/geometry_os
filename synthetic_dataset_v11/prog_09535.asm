; DESCRIPTION: Renders a yellow box of size 107x27 starting at (78, 112).
; PLAN: r0=78(x), r1=112(y), r2=107(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 112
LDI r2, 107
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
