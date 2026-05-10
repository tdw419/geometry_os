; DESCRIPTION: Composite: Places a purple line segment connecting (330, 124) to (210, 29) then Draws a cyan circle centered at (156, 179) with radius 65.
; PLAN: r0=330(x1), r1=124(y1), r2=210(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=156(x), r6=179(y), r7=65(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 330
LDI r1, 124
LDI r2, 210
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 179
LDI r7, 65
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
