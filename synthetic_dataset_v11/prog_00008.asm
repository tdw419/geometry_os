; DESCRIPTION: Draws a cyan circle centered at (51, 129) with radius 47.
; PLAN: r0=51(x), r1=129(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 129
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
