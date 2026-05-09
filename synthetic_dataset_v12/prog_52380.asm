; DESCRIPTION: Draws a cyan circle centered at (411, 120) with radius 55.
; PLAN: r0=411(x), r1=120(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 120
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
