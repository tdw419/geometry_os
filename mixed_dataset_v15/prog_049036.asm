; DESCRIPTION: Renders a white box of size 11x48 starting at (302, 63).
; PLAN: r0=302(x), r1=63(y), r2=11(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 63
LDI r2, 11
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
