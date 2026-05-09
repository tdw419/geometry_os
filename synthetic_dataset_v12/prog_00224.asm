; DESCRIPTION: Composite: Places a red circle of radius 15 at center (176, 225) then Places a green line segment connecting (487, 94) to (65, 29).
; PLAN: r0=176(x), r1=225(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=487(x1), r6=94(y1), r7=65(x2), r8=29(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 225
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 487
LDI r6, 94
LDI r7, 65
LDI r8, 29
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
