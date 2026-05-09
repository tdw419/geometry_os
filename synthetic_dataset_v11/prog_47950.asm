; DESCRIPTION: Renders a white box of size 10x106 starting at (178, 84).
; PLAN: r0=178(x), r1=84(y), r2=10(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 84
LDI r2, 10
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
