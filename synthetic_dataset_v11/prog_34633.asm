; DESCRIPTION: Renders a white box of size 98x109 starting at (2, 58).
; PLAN: r0=2(x), r1=58(y), r2=98(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 58
LDI r2, 98
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
