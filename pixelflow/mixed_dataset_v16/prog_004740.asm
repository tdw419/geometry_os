; DESCRIPTION: Composite: Places a black circle of radius 28 at center (82, 140) then Renders a purple line between points (69, 245) and (473, 44).
; PLAN: r0=82(x), r1=140(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=69(x1), r6=245(y1), r7=473(x2), r8=44(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 140
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 69
LDI r6, 245
LDI r7, 473
LDI r8, 44
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
