; DESCRIPTION: Places a cyan circle of radius 60 at center (156, 160).
; PLAN: r0=156(x), r1=160(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 160
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
