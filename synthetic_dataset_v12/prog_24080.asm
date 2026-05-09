; DESCRIPTION: Renders a white box of size 28x69 starting at (391, 185).
; PLAN: r0=391(x), r1=185(y), r2=28(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 185
LDI r2, 28
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
