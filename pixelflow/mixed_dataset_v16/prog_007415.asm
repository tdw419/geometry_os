; DESCRIPTION: Places a cyan circle of radius 40 at center (190, 208).
; PLAN: r0=190(x), r1=208(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 208
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
