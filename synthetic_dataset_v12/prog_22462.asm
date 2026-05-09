; DESCRIPTION: Renders a white box of size 91x80 starting at (310, 158).
; PLAN: r0=310(x), r1=158(y), r2=91(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 158
LDI r2, 91
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
