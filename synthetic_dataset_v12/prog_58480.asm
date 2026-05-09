; DESCRIPTION: Renders a green box of size 19x65 starting at (402, 34).
; PLAN: r0=402(x), r1=34(y), r2=19(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 34
LDI r2, 19
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
