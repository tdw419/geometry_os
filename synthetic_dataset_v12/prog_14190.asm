; DESCRIPTION: Renders a cyan disk with center (317, 181) and radius 20.
; PLAN: r0=317(x), r1=181(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 181
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
