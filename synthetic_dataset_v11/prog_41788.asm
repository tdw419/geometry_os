; DESCRIPTION: Draws a cyan circle centered at (165, 135) with radius 63.
; PLAN: r0=165(x), r1=135(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 135
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
