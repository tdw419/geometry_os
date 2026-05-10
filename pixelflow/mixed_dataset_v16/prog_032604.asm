; DESCRIPTION: Draws a cyan circle centered at (16, 33) with radius 14.
; PLAN: r0=16(x), r1=33(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 16
LDI r1, 33
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
