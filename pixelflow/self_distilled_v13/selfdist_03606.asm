; DESCRIPTION: Renders a white rectangular region spanning 25 by 52 at (329, 52).
; PLAN: r0=329(x), r1=52(y), r2=25(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 52
LDI r2, 25
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
