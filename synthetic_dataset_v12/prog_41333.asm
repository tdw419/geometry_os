; DESCRIPTION: Renders a white box of size 75x54 starting at (169, 191).
; PLAN: r0=169(x), r1=191(y), r2=75(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 191
LDI r2, 75
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
