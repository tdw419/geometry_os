; DESCRIPTION: Draws a cyan circle centered at (410, 66) with radius 62.
; PLAN: r0=410(x), r1=66(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 66
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
