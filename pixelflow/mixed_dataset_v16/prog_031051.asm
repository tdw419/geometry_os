; DESCRIPTION: Renders a cyan disk with center (193, 138) and radius 75.
; PLAN: r0=193(x), r1=138(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 138
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
