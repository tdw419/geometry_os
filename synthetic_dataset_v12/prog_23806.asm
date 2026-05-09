; DESCRIPTION: Renders a white box of size 81x65 starting at (260, 189).
; PLAN: r0=260(x), r1=189(y), r2=81(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 189
LDI r2, 81
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
