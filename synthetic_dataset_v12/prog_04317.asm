; DESCRIPTION: Renders a green disk with center (443, 172) and radius 67.
; PLAN: r0=443(x), r1=172(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 172
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
