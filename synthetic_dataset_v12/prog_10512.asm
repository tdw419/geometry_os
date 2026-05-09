; DESCRIPTION: Renders a white box of size 30x63 starting at (34, 9).
; PLAN: r0=34(x), r1=9(y), r2=30(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 9
LDI r2, 30
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
