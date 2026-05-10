; DESCRIPTION: Renders a white box of size 90x43 starting at (169, 207).
; PLAN: r0=169(x), r1=207(y), r2=90(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 207
LDI r2, 90
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
