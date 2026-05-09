; DESCRIPTION: Draws a cyan circle centered at (385, 170) with radius 71.
; PLAN: r0=385(x), r1=170(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 170
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
