; DESCRIPTION: Creates a cyan circular shape at (126, 116) with radius 63.
; PLAN: r0=126(x), r1=116(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 116
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
