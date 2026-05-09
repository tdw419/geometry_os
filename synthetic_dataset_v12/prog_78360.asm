; DESCRIPTION: Composite: Creates a purple circular shape at (387, 192) with radius 22 then Renders a blue line between points (313, 177) and (428, 125).
; PLAN: r0=387(x), r1=192(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=313(x1), r6=177(y1), r7=428(x2), r8=125(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 387
LDI r1, 192
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 313
LDI r6, 177
LDI r7, 428
LDI r8, 125
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
