; DESCRIPTION: Renders a white rectangular region spanning 42 by 118 at (155, 172).
; PLAN: r0=155(x), r1=172(y), r2=42(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 172
LDI r2, 42
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
