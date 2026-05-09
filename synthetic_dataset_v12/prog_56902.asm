; DESCRIPTION: Renders a white box of size 13x65 starting at (497, 131).
; PLAN: r0=497(x), r1=131(y), r2=13(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 131
LDI r2, 13
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
