; DESCRIPTION: Renders a orange rectangular region spanning 61 by 38 at (257, 20).
; PLAN: r0=257(x), r1=20(y), r2=61(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 20
LDI r2, 61
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
