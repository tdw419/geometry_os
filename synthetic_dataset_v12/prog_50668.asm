; DESCRIPTION: Draws a green circle centered at (443, 186) with radius 23.
; PLAN: r0=443(x), r1=186(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 186
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
