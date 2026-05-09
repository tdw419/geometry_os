; DESCRIPTION: Composite: Places a yellow circle of radius 80 at center (317, 100) then Places a green line segment connecting (379, 95) to (161, 212).
; PLAN: r0=317(x), r1=100(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x1), r6=95(y1), r7=161(x2), r8=212(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 317
LDI r1, 100
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 95
LDI r7, 161
LDI r8, 212
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
