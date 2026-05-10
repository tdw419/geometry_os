; DESCRIPTION: Renders a white box of size 102x49 starting at (204, 136).
; PLAN: r0=204(x), r1=136(y), r2=102(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 136
LDI r2, 102
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
