; DESCRIPTION: Creates a cyan circular shape at (113, 126) with radius 62.
; PLAN: r0=113(x), r1=126(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 126
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
