; DESCRIPTION: Renders a cyan disk with center (70, 193) and radius 50.
; PLAN: r0=70(x), r1=193(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 193
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
