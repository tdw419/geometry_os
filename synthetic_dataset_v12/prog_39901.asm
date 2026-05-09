; DESCRIPTION: Renders a green box of size 100x102 starting at (204, 104).
; PLAN: r0=204(x), r1=104(y), r2=100(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 104
LDI r2, 100
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
