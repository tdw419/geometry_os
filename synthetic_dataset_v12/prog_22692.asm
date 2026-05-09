; DESCRIPTION: Draws a yellow circle centered at (479, 124) with radius 13.
; PLAN: r0=479(x), r1=124(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 479
LDI r1, 124
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
