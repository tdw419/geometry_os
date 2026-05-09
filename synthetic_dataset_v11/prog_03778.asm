; DESCRIPTION: Renders a cyan disk with center (210, 120) and radius 22.
; PLAN: r0=210(x), r1=120(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 120
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
