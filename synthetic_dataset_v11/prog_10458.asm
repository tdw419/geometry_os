; DESCRIPTION: Draws a cyan circle centered at (198, 198) with radius 45.
; PLAN: r0=198(x), r1=198(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 198
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
