; DESCRIPTION: Renders a white rectangular region spanning 94 by 10 at (319, 107).
; PLAN: r0=319(x), r1=107(y), r2=94(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 107
LDI r2, 94
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
