; DESCRIPTION: Composite: Places a white circle of radius 70 at center (102, 151) then Renders a blue line between points (108, 141) and (264, 245).
; PLAN: r0=102(x), r1=151(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x1), r6=141(y1), r7=264(x2), r8=245(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 102
LDI r1, 151
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 141
LDI r7, 264
LDI r8, 245
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
