; DESCRIPTION: Draws a cyan circle centered at (97, 186) with radius 65.
; PLAN: r0=97(x), r1=186(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 186
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
