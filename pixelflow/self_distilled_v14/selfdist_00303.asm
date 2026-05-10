; DESCRIPTION: Renders a white rectangular region spanning 106 by 86 at (106, 106).
; PLAN: r0=106(x), r1=106(y), r2=106(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 106
LDI r2, 106
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
