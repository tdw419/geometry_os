; DESCRIPTION: Draws a cyan circle centered at (450, 60) with radius 13.
; PLAN: r0=450(x), r1=60(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 60
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
