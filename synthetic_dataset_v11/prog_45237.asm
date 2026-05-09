; DESCRIPTION: Places a black circle of radius 20 at center (215, 27).
; PLAN: r0=215(x), r1=27(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 27
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
