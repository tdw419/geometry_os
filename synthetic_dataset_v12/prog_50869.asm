; DESCRIPTION: Draws a cyan circle centered at (422, 50) with radius 38.
; PLAN: r0=422(x), r1=50(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 50
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
