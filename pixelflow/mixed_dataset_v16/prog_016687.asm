; DESCRIPTION: Renders a cyan disk with center (295, 119) and radius 80.
; PLAN: r0=295(x), r1=119(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 119
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
