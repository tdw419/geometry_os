; DESCRIPTION: Creates a cyan circular shape at (179, 208) with radius 38.
; PLAN: r0=179(x), r1=208(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 208
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
