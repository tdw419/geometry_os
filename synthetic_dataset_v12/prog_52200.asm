; DESCRIPTION: Draws a cyan circle centered at (392, 94) with radius 73.
; PLAN: r0=392(x), r1=94(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 94
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
