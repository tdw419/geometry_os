; DESCRIPTION: Draws a cyan circle centered at (109, 162) with radius 42.
; PLAN: r0=109(x), r1=162(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 162
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
