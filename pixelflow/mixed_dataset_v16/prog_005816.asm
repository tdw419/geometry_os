; DESCRIPTION: Renders a green box of size 36x78 starting at (334, 19).
; PLAN: r0=334(x), r1=19(y), r2=36(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 19
LDI r2, 36
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
