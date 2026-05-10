; DESCRIPTION: Renders a white box of size 58x43 starting at (319, 181).
; PLAN: r0=319(x), r1=181(y), r2=58(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 181
LDI r2, 58
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
