; DESCRIPTION: Renders a white box of size 46x84 starting at (89, 68).
; PLAN: r0=89(x), r1=68(y), r2=46(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 68
LDI r2, 46
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
