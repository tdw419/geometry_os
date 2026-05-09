; DESCRIPTION: Draws a cyan circle centered at (154, 106) with radius 38.
; PLAN: r0=154(x), r1=106(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 106
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
