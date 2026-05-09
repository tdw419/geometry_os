; DESCRIPTION: Draws a cyan circle centered at (273, 188) with radius 65.
; PLAN: r0=273(x), r1=188(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 188
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
