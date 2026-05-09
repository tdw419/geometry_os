; DESCRIPTION: Places a cyan circle of radius 62 at center (127, 109).
; PLAN: r0=127(x), r1=109(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 109
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
