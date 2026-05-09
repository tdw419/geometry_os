; DESCRIPTION: Places a cyan circle of radius 63 at center (232, 86).
; PLAN: r0=232(x), r1=86(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 232
LDI r1, 86
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
