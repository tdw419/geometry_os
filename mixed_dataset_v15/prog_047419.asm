; DESCRIPTION: Renders a white rectangular region spanning 67 by 78 at (303, 2).
; PLAN: r0=303(x), r1=2(y), r2=67(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 2
LDI r2, 67
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
