; DESCRIPTION: Places a cyan circle of radius 65 at center (190, 83).
; PLAN: r0=190(x), r1=83(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 83
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
