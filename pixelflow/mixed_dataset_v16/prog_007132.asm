; DESCRIPTION: Renders a white rectangular region spanning 32 by 115 at (304, 66).
; PLAN: r0=304(x), r1=66(y), r2=32(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 66
LDI r2, 32
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
