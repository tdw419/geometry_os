; DESCRIPTION: Renders a white box of size 98x108 starting at (118, 69).
; PLAN: r0=118(x), r1=69(y), r2=98(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 69
LDI r2, 98
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
