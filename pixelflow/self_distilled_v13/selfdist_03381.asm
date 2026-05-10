; DESCRIPTION: Draws a cyan circle centered at (212, 4) with radius 54.
; PLAN: r0=212(x), r1=4(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 4
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
