; DESCRIPTION: Composite: Creates a magenta circular shape at (138, 136) with radius 68 then Draws a green line from (467, 241) to (242, 140).
; PLAN: r0=138(x), r1=136(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=467(x1), r6=241(y1), r7=242(x2), r8=140(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 136
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 467
LDI r6, 241
LDI r7, 242
LDI r8, 140
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
