; DESCRIPTION: Renders a white rectangular region spanning 98 by 23 at (126, 124).
; PLAN: r0=126(x), r1=124(y), r2=98(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 124
LDI r2, 98
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
