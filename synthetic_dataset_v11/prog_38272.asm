; DESCRIPTION: Draws a cyan circle centered at (208, 52) with radius 42.
; PLAN: r0=208(x), r1=52(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 52
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
