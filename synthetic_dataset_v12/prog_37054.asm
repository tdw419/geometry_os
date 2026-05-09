; DESCRIPTION: Renders a white box of size 94x85 starting at (283, 116).
; PLAN: r0=283(x), r1=116(y), r2=94(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 116
LDI r2, 94
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
