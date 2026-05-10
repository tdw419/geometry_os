; DESCRIPTION: Draws a cyan circle centered at (433, 124) with radius 69.
; PLAN: r0=433(x), r1=124(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 124
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
