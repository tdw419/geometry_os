; DESCRIPTION: Renders a red disk with center (164, 206) and radius 15.
; PLAN: r0=164(x), r1=206(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 206
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
