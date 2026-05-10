; DESCRIPTION: Renders a white rectangular region spanning 23 by 13 at (230, 114).
; PLAN: r0=230(x), r1=114(y), r2=23(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 114
LDI r2, 23
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
