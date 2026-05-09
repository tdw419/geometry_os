; DESCRIPTION: Places a cyan circle of radius 31 at center (180, 56).
; PLAN: r0=180(x), r1=56(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 56
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
