; DESCRIPTION: Places a cyan circle of radius 31 at center (87, 128).
; PLAN: r0=87(x), r1=128(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 128
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
