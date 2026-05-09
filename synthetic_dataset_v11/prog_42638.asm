; DESCRIPTION: Places a cyan circle of radius 52 at center (151, 63).
; PLAN: r0=151(x), r1=63(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 63
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
