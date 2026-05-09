; DESCRIPTION: Draws a cyan circle centered at (433, 63) with radius 47.
; PLAN: r0=433(x), r1=63(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 63
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
