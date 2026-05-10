; DESCRIPTION: Draws a cyan circle centered at (422, 90) with radius 79.
; PLAN: r0=422(x), r1=90(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 90
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
