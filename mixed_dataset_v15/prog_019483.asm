; DESCRIPTION: Composite: Places a cyan line segment connecting (358, 200) to (474, 215) then Draws a green circle centered at (455, 37) with radius 11.
; PLAN: r0=358(x1), r1=200(y1), r2=474(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=455(x), r6=37(y), r7=11(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 358
LDI r1, 200
LDI r2, 474
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 37
LDI r7, 11
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
