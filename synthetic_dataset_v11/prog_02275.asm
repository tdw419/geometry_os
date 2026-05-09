; DESCRIPTION: Draws a cyan circle centered at (90, 177) with radius 63.
; PLAN: r0=90(x), r1=177(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 177
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
