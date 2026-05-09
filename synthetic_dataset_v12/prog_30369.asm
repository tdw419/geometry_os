; DESCRIPTION: Creates a cyan circular shape at (146, 190) with radius 34.
; PLAN: r0=146(x), r1=190(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 190
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
