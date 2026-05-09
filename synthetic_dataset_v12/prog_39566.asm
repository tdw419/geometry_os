; DESCRIPTION: Places a green circle of radius 18 at center (443, 126).
; PLAN: r0=443(x), r1=126(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 126
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
