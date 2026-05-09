; DESCRIPTION: Renders a cyan disk with center (393, 99) and radius 50.
; PLAN: r0=393(x), r1=99(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 99
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
