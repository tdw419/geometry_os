; DESCRIPTION: Renders a white box of size 114x67 starting at (169, 159).
; PLAN: r0=169(x), r1=159(y), r2=114(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 159
LDI r2, 114
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
