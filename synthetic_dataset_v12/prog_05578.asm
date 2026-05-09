; DESCRIPTION: Composite: Places a purple circle of radius 57 at center (334, 135) then Places a yellow line segment connecting (199, 247) to (328, 68).
; PLAN: r0=334(x), r1=135(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=199(x1), r6=247(y1), r7=328(x2), r8=68(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 135
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 199
LDI r6, 247
LDI r7, 328
LDI r8, 68
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
