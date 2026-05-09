; DESCRIPTION: Places a cyan circle of radius 68 at center (355, 160).
; PLAN: r0=355(x), r1=160(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 160
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
