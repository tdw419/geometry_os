; DESCRIPTION: Draws a cyan circle centered at (358, 91) with radius 68.
; PLAN: r0=358(x), r1=91(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 91
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
