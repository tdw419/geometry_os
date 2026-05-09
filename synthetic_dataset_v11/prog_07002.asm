; DESCRIPTION: Renders a white box of size 23x98 starting at (183, 68).
; PLAN: r0=183(x), r1=68(y), r2=23(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 68
LDI r2, 23
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
