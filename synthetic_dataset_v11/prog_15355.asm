; DESCRIPTION: Draws a cyan circle centered at (65, 95) with radius 55.
; PLAN: r0=65(x), r1=95(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 95
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
