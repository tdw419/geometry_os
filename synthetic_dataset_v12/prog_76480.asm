; DESCRIPTION: Draws a cyan circle centered at (196, 192) with radius 60.
; PLAN: r0=196(x), r1=192(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 192
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
