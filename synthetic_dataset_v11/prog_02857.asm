; DESCRIPTION: Draws a cyan circle centered at (168, 132) with radius 46.
; PLAN: r0=168(x), r1=132(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 132
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
