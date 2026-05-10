; DESCRIPTION: Creates a cyan circular shape at (296, 85) with radius 80.
; PLAN: r0=296(x), r1=85(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 85
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
