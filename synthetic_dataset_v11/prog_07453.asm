; DESCRIPTION: Places a cyan circle of radius 20 at center (186, 63).
; PLAN: r0=186(x), r1=63(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 63
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
