; DESCRIPTION: Composite: Sets a single green pixel at (487, 207) then Renders a green line between points (336, 141) and (253, 110) then Renders a cyan disk with center (419, 233) and radius 18.
; PLAN: r0=487(x), r1=207(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=336(x1), r6=141(y1), r7=253(x2), r8=110(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=419(x), r11=233(y), r12=18(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 487
LDI r1, 207
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 336
LDI r6, 141
LDI r7, 253
LDI r8, 110
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 419
LDI r11, 233
LDI r12, 18
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
