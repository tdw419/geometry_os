; DESCRIPTION: Draws a green circle centered at (401, 212) with radius 21.
; PLAN: r0=401(x), r1=212(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 212
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
