; DESCRIPTION: Renders a white box of size 93x63 starting at (145, 9).
; PLAN: r0=145(x), r1=9(y), r2=93(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 9
LDI r2, 93
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
