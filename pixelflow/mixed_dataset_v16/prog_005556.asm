; DESCRIPTION: Renders a white rectangular region spanning 117 by 19 at (380, 43).
; PLAN: r0=380(x), r1=43(y), r2=117(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 43
LDI r2, 117
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
