; DESCRIPTION: Creates a cyan circular shape at (103, 159) with radius 80.
; PLAN: r0=103(x), r1=159(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 159
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
