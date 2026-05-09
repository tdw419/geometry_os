; DESCRIPTION: Draws a cyan circle centered at (71, 120) with radius 56.
; PLAN: r0=71(x), r1=120(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 120
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
