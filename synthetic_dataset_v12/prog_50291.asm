; DESCRIPTION: Renders a white box of size 53x31 starting at (111, 89).
; PLAN: r0=111(x), r1=89(y), r2=53(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 89
LDI r2, 53
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
