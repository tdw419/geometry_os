; DESCRIPTION: Draws a cyan circle centered at (169, 60) with radius 34.
; PLAN: r0=169(x), r1=60(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 60
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
