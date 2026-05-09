; DESCRIPTION: Renders a white box of size 14x54 starting at (495, 148).
; PLAN: r0=495(x), r1=148(y), r2=14(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 148
LDI r2, 14
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
