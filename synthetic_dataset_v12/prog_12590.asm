; DESCRIPTION: Renders a white box of size 34x62 starting at (204, 9).
; PLAN: r0=204(x), r1=9(y), r2=34(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 9
LDI r2, 34
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
