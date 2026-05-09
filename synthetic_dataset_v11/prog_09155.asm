; DESCRIPTION: Places a cyan circle of radius 63 at center (81, 186).
; PLAN: r0=81(x), r1=186(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 186
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
