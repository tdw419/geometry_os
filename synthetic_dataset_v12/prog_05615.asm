; DESCRIPTION: Draws a cyan circle centered at (367, 149) with radius 58.
; PLAN: r0=367(x), r1=149(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 149
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
