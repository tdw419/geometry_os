; DESCRIPTION: Renders a white box of size 33x54 starting at (267, 121).
; PLAN: r0=267(x), r1=121(y), r2=33(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 121
LDI r2, 33
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
