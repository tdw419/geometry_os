; DESCRIPTION: Creates a cyan circular shape at (393, 93) with radius 43.
; PLAN: r0=393(x), r1=93(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 93
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
