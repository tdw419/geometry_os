; DESCRIPTION: Renders a white box of size 105x89 starting at (309, 103).
; PLAN: r0=309(x), r1=103(y), r2=105(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 103
LDI r2, 105
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
