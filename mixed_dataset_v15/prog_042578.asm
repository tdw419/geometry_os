; DESCRIPTION: Renders a white rectangular region spanning 101 by 37 at (257, 146).
; PLAN: r0=257(x), r1=146(y), r2=101(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 146
LDI r2, 101
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
