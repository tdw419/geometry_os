; DESCRIPTION: Draws a cyan circle centered at (220, 29) with radius 53.
; PLAN: r0=220(x), r1=29(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 29
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
