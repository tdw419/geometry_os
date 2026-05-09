; DESCRIPTION: Renders a cyan disk with center (200, 209) and radius 10.
; PLAN: r0=200(x), r1=209(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 209
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
