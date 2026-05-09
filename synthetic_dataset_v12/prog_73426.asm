; DESCRIPTION: Draws a yellow circle centered at (352, 128) with radius 46.
; PLAN: r0=352(x), r1=128(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 128
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
