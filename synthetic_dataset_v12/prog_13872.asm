; DESCRIPTION: Composite: Creates a cyan circular shape at (133, 74) with radius 35 then Draws a blue line from (468, 191) to (386, 62).
; PLAN: r0=133(x), r1=74(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=468(x1), r6=191(y1), r7=386(x2), r8=62(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 74
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 468
LDI r6, 191
LDI r7, 386
LDI r8, 62
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
