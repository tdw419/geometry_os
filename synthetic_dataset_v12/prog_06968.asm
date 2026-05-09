; DESCRIPTION: Renders a green box of size 60x56 starting at (334, 102).
; PLAN: r0=334(x), r1=102(y), r2=60(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 102
LDI r2, 60
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
