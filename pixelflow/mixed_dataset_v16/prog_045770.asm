; DESCRIPTION: Composite: Creates a purple circular shape at (487, 105) with radius 16 then Draws a green line from (317, 232) to (186, 184).
; PLAN: r0=487(x), r1=105(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=317(x1), r6=232(y1), r7=186(x2), r8=184(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 487
LDI r1, 105
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 317
LDI r6, 232
LDI r7, 186
LDI r8, 184
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
