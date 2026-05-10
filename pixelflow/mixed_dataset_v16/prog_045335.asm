; DESCRIPTION: Renders a cyan disk with center (371, 117) and radius 56.
; PLAN: r0=371(x), r1=117(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 117
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
