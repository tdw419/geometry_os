; DESCRIPTION: Renders a white box of size 59x70 starting at (381, 170).
; PLAN: r0=381(x), r1=170(y), r2=59(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 170
LDI r2, 59
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
