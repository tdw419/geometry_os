; DESCRIPTION: Renders a cyan disk with center (102, 188) and radius 22.
; PLAN: r0=102(x), r1=188(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 188
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
