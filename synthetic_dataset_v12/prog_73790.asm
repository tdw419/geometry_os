; DESCRIPTION: Composite: Draws a magenta line from (314, 226) to (393, 72) then Creates a cyan circular shape at (202, 142) with radius 75.
; PLAN: r0=314(x1), r1=226(y1), r2=393(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=142(y), r7=75(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 314
LDI r1, 226
LDI r2, 393
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 142
LDI r7, 75
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
