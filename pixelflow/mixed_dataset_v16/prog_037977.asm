; DESCRIPTION: Draws a cyan circle centered at (349, 57) with radius 28.
; PLAN: r0=349(x), r1=57(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 57
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
