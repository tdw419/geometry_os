; DESCRIPTION: Draws a cyan circle centered at (154, 34) with radius 30.
; PLAN: r0=154(x), r1=34(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 34
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
