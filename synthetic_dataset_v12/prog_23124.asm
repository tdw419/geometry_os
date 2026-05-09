; DESCRIPTION: Renders a cyan disk with center (146, 191) and radius 23.
; PLAN: r0=146(x), r1=191(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 191
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
