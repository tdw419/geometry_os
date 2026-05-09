; DESCRIPTION: Draws a cyan circle centered at (57, 44) with radius 28.
; PLAN: r0=57(x), r1=44(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 44
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
