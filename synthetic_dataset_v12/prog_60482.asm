; DESCRIPTION: Renders a white box of size 16x82 starting at (471, 31).
; PLAN: r0=471(x), r1=31(y), r2=16(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 31
LDI r2, 16
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
