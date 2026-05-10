; DESCRIPTION: Composite: Places a purple dot at position (363, 101) then Creates a magenta circular shape at (59, 60) with radius 40 then Renders a green line between points (487, 20) and (323, 69).
; PLAN: r0=363(x), r1=101(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=60(y), r7=40(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=487(x1), r11=20(y1), r12=323(x2), r13=69(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 101
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 59
LDI r6, 60
LDI r7, 40
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 487
LDI r11, 20
LDI r12, 323
LDI r13, 69
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
