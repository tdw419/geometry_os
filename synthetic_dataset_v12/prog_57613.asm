; DESCRIPTION: Renders a red disk with center (302, 126) and radius 76.
; PLAN: r0=302(x), r1=126(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 126
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
