; DESCRIPTION: Draws a cyan circle centered at (410, 25) with radius 20.
; PLAN: r0=410(x), r1=25(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 25
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
