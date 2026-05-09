; DESCRIPTION: Places a cyan circle of radius 48 at center (241, 186).
; PLAN: r0=241(x), r1=186(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 186
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
