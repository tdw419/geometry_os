; DESCRIPTION: Draws a cyan circle centered at (225, 129) with radius 80.
; PLAN: r0=225(x), r1=129(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 129
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
