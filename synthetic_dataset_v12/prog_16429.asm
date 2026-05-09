; DESCRIPTION: Renders a white box of size 49x112 starting at (133, 134).
; PLAN: r0=133(x), r1=134(y), r2=49(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 134
LDI r2, 49
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
