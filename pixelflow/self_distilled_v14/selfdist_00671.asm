; DESCRIPTION: Renders a white rectangular region spanning 35 by 50 at (257, 121).
; PLAN: r0=257(x), r1=121(y), r2=35(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 121
LDI r2, 35
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
