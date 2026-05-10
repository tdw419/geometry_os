; DESCRIPTION: Renders a white box of size 109x113 starting at (119, 78).
; PLAN: r0=119(x), r1=78(y), r2=109(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 78
LDI r2, 109
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
