; DESCRIPTION: Renders a white box of size 40x112 starting at (95, 83).
; PLAN: r0=95(x), r1=83(y), r2=40(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 83
LDI r2, 40
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
