; DESCRIPTION: Draws a green circle centered at (205, 126) with radius 42.
; PLAN: r0=205(x), r1=126(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 126
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
