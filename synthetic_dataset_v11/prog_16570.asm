; DESCRIPTION: Draws a cyan circle centered at (99, 69) with radius 68.
; PLAN: r0=99(x), r1=69(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 69
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
