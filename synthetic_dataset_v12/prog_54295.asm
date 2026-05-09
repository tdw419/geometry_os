; DESCRIPTION: Draws a cyan circle centered at (237, 140) with radius 42.
; PLAN: r0=237(x), r1=140(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 140
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
