; DESCRIPTION: Composite: Places a magenta dot at position (470, 114) then Places a yellow line segment connecting (119, 108) to (403, 245).
; PLAN: r0=470(x), r1=114(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=119(x1), r6=108(y1), r7=403(x2), r8=245(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 470
LDI r1, 114
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 119
LDI r6, 108
LDI r7, 403
LDI r8, 245
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
