; DESCRIPTION: Renders a white box of size 24x112 starting at (5, 63).
; PLAN: r0=5(x), r1=63(y), r2=24(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 63
LDI r2, 24
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
