; DESCRIPTION: Draws a red circle centered at (209, 124) with radius 44.
; PLAN: r0=209(x), r1=124(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 124
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
