; DESCRIPTION: Renders a green box of size 119x23 starting at (208, 65).
; PLAN: r0=208(x), r1=65(y), r2=119(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 65
LDI r2, 119
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
