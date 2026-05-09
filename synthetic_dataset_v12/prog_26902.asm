; DESCRIPTION: Renders a green box of size 95x63 starting at (334, 35).
; PLAN: r0=334(x), r1=35(y), r2=95(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 35
LDI r2, 95
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
