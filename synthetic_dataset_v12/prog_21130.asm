; DESCRIPTION: Renders a green box of size 53x106 starting at (225, 149).
; PLAN: r0=225(x), r1=149(y), r2=53(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 149
LDI r2, 53
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
