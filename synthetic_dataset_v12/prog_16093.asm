; DESCRIPTION: Draws a cyan circle centered at (378, 161) with radius 70.
; PLAN: r0=378(x), r1=161(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 161
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
