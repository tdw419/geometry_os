; DESCRIPTION: Composite: Places a cyan circle of radius 46 at center (350, 201) then Places a green line segment connecting (59, 161) to (80, 183).
; PLAN: r0=350(x), r1=201(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=59(x1), r6=161(y1), r7=80(x2), r8=183(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 350
LDI r1, 201
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 59
LDI r6, 161
LDI r7, 80
LDI r8, 183
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
