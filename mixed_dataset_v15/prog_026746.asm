; DESCRIPTION: Renders a cyan disk with center (176, 215) and radius 37.
; PLAN: r0=176(x), r1=215(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 215
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
