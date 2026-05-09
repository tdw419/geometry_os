; DESCRIPTION: Composite: Renders a magenta box of size 17x75 starting at (159, 80) then Renders a green line between points (22, 57) and (190, 124).
; PLAN: r0=159(x), r1=80(y), r2=17(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=22(x1), r6=57(y1), r7=190(x2), r8=124(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 159
LDI r1, 80
LDI r2, 17
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 57
LDI r7, 190
LDI r8, 124
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
