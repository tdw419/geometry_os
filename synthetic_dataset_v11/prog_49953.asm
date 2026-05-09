; DESCRIPTION: Places a cyan circle of radius 63 at center (91, 72).
; PLAN: r0=91(x), r1=72(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 72
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
