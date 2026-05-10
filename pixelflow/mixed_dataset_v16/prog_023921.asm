; DESCRIPTION: Places a green circle of radius 68 at center (443, 181).
; PLAN: r0=443(x), r1=181(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 181
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
