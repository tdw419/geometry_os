; DESCRIPTION: Renders a white box of size 107x112 starting at (18, 0).
; PLAN: r0=18(x), r1=0(y), r2=107(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 0
LDI r2, 107
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
