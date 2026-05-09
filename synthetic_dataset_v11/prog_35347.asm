; DESCRIPTION: Renders a white box of size 33x77 starting at (62, 63).
; PLAN: r0=62(x), r1=63(y), r2=33(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 63
LDI r2, 33
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
