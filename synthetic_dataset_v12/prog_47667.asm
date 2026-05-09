; DESCRIPTION: Renders a cyan disk with center (480, 25) and radius 11.
; PLAN: r0=480(x), r1=25(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 480
LDI r1, 25
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
