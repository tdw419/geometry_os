; DESCRIPTION: Composite: Draws a red circle centered at (48, 94) with radius 13 then Draws a magenta line from (104, 57) to (498, 164).
; PLAN: r0=48(x), r1=94(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x1), r6=57(y1), r7=498(x2), r8=164(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 48
LDI r1, 94
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 57
LDI r7, 498
LDI r8, 164
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
