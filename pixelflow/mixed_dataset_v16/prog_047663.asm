; DESCRIPTION: Renders a white box of size 107x63 starting at (227, 157).
; PLAN: r0=227(x), r1=157(y), r2=107(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 157
LDI r2, 107
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
