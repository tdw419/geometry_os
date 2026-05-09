; DESCRIPTION: Renders a white box of size 117x105 starting at (61, 140).
; PLAN: r0=61(x), r1=140(y), r2=117(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 140
LDI r2, 117
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
