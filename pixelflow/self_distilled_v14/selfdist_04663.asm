; DESCRIPTION: Renders a white rectangular region spanning 68 by 99 at (11, 158).
; PLAN: r0=11(x), r1=158(y), r2=68(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 158
LDI r2, 68
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
