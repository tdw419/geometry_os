; DESCRIPTION: Renders a cyan disk with center (215, 220) and radius 35.
; PLAN: r0=215(x), r1=220(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 220
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
