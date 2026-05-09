; DESCRIPTION: Places a cyan circle of radius 16 at center (156, 39).
; PLAN: r0=156(x), r1=39(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 39
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
