; DESCRIPTION: Draws a cyan circle centered at (119, 164) with radius 70.
; PLAN: r0=119(x), r1=164(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 164
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
