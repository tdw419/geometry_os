; DESCRIPTION: Draws a cyan circle centered at (42, 50) with radius 31.
; PLAN: r0=42(x), r1=50(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 50
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
