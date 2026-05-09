; DESCRIPTION: Renders a white box of size 100x36 starting at (165, 149).
; PLAN: r0=165(x), r1=149(y), r2=100(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 149
LDI r2, 100
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
