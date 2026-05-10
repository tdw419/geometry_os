; DESCRIPTION: Draws a cyan circle centered at (152, 195) with radius 56.
; PLAN: r0=152(x), r1=195(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 195
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
