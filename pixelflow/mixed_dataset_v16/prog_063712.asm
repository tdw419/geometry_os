; DESCRIPTION: Draws a cyan circle centered at (473, 205) with radius 25.
; PLAN: r0=473(x), r1=205(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 473
LDI r1, 205
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
