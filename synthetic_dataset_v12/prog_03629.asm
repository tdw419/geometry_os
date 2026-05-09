; DESCRIPTION: Renders a green box of size 76x52 starting at (334, 7).
; PLAN: r0=334(x), r1=7(y), r2=76(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 7
LDI r2, 76
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
