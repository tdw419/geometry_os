; DESCRIPTION: Places a cyan circle of radius 12 at center (124, 186).
; PLAN: r0=124(x), r1=186(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 186
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
