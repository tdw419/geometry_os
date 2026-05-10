; DESCRIPTION: Renders a green box of size 52x106 starting at (69, 63).
; PLAN: r0=69(x), r1=63(y), r2=52(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 63
LDI r2, 52
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
