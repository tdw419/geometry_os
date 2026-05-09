; DESCRIPTION: Draws a cyan circle centered at (152, 102) with radius 32.
; PLAN: r0=152(x), r1=102(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 102
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
