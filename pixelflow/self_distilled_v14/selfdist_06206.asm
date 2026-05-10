; DESCRIPTION: Draws a cyan circle centered at (146, 19) with radius 11.
; PLAN: r0=146(x), r1=19(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 19
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
