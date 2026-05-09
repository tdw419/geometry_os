; DESCRIPTION: Renders a cyan disk with center (215, 37) and radius 20.
; PLAN: r0=215(x), r1=37(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 37
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
