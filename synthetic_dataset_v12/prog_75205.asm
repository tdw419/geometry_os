; DESCRIPTION: Draws a cyan circle centered at (371, 90) with radius 47.
; PLAN: r0=371(x), r1=90(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 90
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
