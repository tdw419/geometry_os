; DESCRIPTION: Renders a white box of size 38x96 starting at (358, 130).
; PLAN: r0=358(x), r1=130(y), r2=38(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 130
LDI r2, 38
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
