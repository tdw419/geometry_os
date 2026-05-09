; DESCRIPTION: Draws a cyan circle centered at (335, 129) with radius 65.
; PLAN: r0=335(x), r1=129(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 129
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
