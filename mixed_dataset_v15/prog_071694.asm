; DESCRIPTION: Places a red circle of radius 31 at center (455, 206).
; PLAN: r0=455(x), r1=206(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 206
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
