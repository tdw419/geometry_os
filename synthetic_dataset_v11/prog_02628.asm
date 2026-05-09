; DESCRIPTION: Renders a green box of size 33x66 starting at (141, 159).
; PLAN: r0=141(x), r1=159(y), r2=33(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 159
LDI r2, 33
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
