; DESCRIPTION: Composite: Creates a orange circular shape at (242, 202) with radius 45 then Renders a yellow line between points (419, 196) and (147, 244).
; PLAN: r0=242(x), r1=202(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=419(x1), r6=196(y1), r7=147(x2), r8=244(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 202
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 419
LDI r6, 196
LDI r7, 147
LDI r8, 244
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
