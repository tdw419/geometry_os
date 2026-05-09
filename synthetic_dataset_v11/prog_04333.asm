; DESCRIPTION: Renders a white box of size 85x35 starting at (56, 196).
; PLAN: r0=56(x), r1=196(y), r2=85(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 196
LDI r2, 85
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
