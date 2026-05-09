; DESCRIPTION: Draws a cyan circle centered at (216, 194) with radius 37.
; PLAN: r0=216(x), r1=194(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 194
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
