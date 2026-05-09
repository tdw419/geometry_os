; DESCRIPTION: Draws a cyan circle centered at (66, 229) with radius 18.
; PLAN: r0=66(x), r1=229(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 229
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
