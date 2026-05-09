; DESCRIPTION: Renders a white box of size 20x33 starting at (465, 158).
; PLAN: r0=465(x), r1=158(y), r2=20(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 158
LDI r2, 20
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
