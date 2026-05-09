; DESCRIPTION: Renders a red disk with center (398, 176) and radius 62.
; PLAN: r0=398(x), r1=176(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 176
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
