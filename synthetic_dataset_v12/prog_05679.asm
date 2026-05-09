; DESCRIPTION: Places a cyan circle of radius 16 at center (385, 87).
; PLAN: r0=385(x), r1=87(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 87
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
