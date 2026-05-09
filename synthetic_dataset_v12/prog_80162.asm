; DESCRIPTION: Creates a cyan circular shape at (237, 120) with radius 32.
; PLAN: r0=237(x), r1=120(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 120
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
