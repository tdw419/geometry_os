; DESCRIPTION: Draws a cyan circle centered at (350, 125) with radius 44.
; PLAN: r0=350(x), r1=125(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 125
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
