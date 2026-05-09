; DESCRIPTION: Renders a white box of size 13x105 starting at (358, 138).
; PLAN: r0=358(x), r1=138(y), r2=13(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 138
LDI r2, 13
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
