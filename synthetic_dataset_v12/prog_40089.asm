; DESCRIPTION: Creates a cyan circular shape at (393, 127) with radius 77.
; PLAN: r0=393(x), r1=127(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 127
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
