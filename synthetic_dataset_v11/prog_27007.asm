; DESCRIPTION: Renders a white box of size 108x108 starting at (91, 129).
; PLAN: r0=91(x), r1=129(y), r2=108(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 129
LDI r2, 108
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
