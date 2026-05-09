; DESCRIPTION: Renders a white box of size 13x60 starting at (145, 49).
; PLAN: r0=145(x), r1=49(y), r2=13(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 49
LDI r2, 13
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
