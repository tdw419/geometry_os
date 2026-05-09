; DESCRIPTION: Creates a cyan circular shape at (168, 81) with radius 64.
; PLAN: r0=168(x), r1=81(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 81
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
