; DESCRIPTION: Draws a cyan circle centered at (130, 150) with radius 77.
; PLAN: r0=130(x), r1=150(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 150
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
