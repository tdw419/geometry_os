; DESCRIPTION: Draws a cyan circle centered at (156, 60) with radius 10.
; PLAN: r0=156(x), r1=60(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 60
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
