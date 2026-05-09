; DESCRIPTION: Renders a white box of size 43x20 starting at (100, 47).
; PLAN: r0=100(x), r1=47(y), r2=43(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 47
LDI r2, 43
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
