; DESCRIPTION: Composite: Renders a magenta line between points (144, 226) and (231, 238) then Draws a green circle centered at (370, 32) with radius 31.
; PLAN: r0=144(x1), r1=226(y1), r2=231(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=32(y), r7=31(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 144
LDI r1, 226
LDI r2, 231
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 32
LDI r7, 31
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
