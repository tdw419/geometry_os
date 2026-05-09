; DESCRIPTION: Renders a white box of size 34x70 starting at (1, 155).
; PLAN: r0=1(x), r1=155(y), r2=34(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 155
LDI r2, 34
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
