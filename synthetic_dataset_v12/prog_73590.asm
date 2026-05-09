; DESCRIPTION: Places a cyan circle of radius 35 at center (215, 45).
; PLAN: r0=215(x), r1=45(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 45
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
