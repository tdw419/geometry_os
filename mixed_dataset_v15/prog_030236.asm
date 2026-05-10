; DESCRIPTION: Renders a white box of size 85x118 starting at (143, 68).
; PLAN: r0=143(x), r1=68(y), r2=85(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 68
LDI r2, 85
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
