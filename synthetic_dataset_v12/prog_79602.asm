; DESCRIPTION: Creates a cyan circular shape at (349, 149) with radius 34.
; PLAN: r0=349(x), r1=149(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 149
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
