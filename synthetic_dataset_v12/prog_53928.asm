; DESCRIPTION: Composite: Draws a magenta line from (350, 179) to (126, 25) then Draws a green circle centered at (94, 98) with radius 49.
; PLAN: r0=350(x1), r1=179(y1), r2=126(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=94(x), r6=98(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 350
LDI r1, 179
LDI r2, 126
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 98
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
