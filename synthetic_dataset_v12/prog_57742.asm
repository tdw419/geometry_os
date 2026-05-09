; DESCRIPTION: Renders a green box of size 81x10 starting at (251, 140).
; PLAN: r0=251(x), r1=140(y), r2=81(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 140
LDI r2, 81
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
