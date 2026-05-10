; DESCRIPTION: Renders a yellow box of size 75x49 starting at (283, 140).
; PLAN: r0=283(x), r1=140(y), r2=75(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 140
LDI r2, 75
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
