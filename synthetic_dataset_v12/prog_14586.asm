; DESCRIPTION: Creates a cyan circular shape at (177, 213) with radius 42.
; PLAN: r0=177(x), r1=213(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 213
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
