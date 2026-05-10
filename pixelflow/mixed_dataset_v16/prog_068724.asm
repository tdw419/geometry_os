; DESCRIPTION: Renders a white box of size 13x19 starting at (157, 81).
; PLAN: r0=157(x), r1=81(y), r2=13(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 81
LDI r2, 13
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
