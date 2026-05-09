; DESCRIPTION: Places a cyan circle of radius 27 at center (52, 208).
; PLAN: r0=52(x), r1=208(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 208
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
