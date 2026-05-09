; DESCRIPTION: Renders a white box of size 25x73 starting at (40, 181).
; PLAN: r0=40(x), r1=181(y), r2=25(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 181
LDI r2, 25
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
