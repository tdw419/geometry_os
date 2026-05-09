; DESCRIPTION: Renders a cyan disk with center (158, 178) and radius 10.
; PLAN: r0=158(x), r1=178(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 178
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
