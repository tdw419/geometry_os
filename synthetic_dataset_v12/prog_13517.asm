; DESCRIPTION: Draws a yellow circle centered at (255, 125) with radius 46.
; PLAN: r0=255(x), r1=125(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 125
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
