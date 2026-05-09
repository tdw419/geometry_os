; DESCRIPTION: Draws a cyan circle centered at (236, 140) with radius 57.
; PLAN: r0=236(x), r1=140(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 140
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
