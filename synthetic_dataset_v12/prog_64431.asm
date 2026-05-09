; DESCRIPTION: Composite: Creates a yellow circular shape at (71, 127) with radius 18 then Renders a green line between points (45, 37) and (183, 59).
; PLAN: r0=71(x), r1=127(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x1), r6=37(y1), r7=183(x2), r8=59(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 127
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 37
LDI r7, 183
LDI r8, 59
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
