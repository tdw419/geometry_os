; DESCRIPTION: Places a green circle of radius 23 at center (215, 50).
; PLAN: r0=215(x), r1=50(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 50
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
