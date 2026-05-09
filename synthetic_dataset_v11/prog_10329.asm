; DESCRIPTION: Renders a cyan disk with center (117, 84) and radius 16.
; PLAN: r0=117(x), r1=84(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 84
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
