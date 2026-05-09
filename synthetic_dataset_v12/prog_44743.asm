; DESCRIPTION: Renders a white box of size 35x36 starting at (85, 141).
; PLAN: r0=85(x), r1=141(y), r2=35(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 141
LDI r2, 35
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
