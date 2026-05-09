; DESCRIPTION: Composite: Renders a yellow disk with center (299, 124) and radius 67 then Places a red dot at position (451, 206).
; PLAN: r0=299(x), r1=124(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x), r6=206(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 299
LDI r1, 124
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 206
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
