; DESCRIPTION: Composite: Places a yellow line segment connecting (99, 27) to (261, 189) then Places a green circle of radius 12 at center (164, 164).
; PLAN: r0=99(x1), r1=27(y1), r2=261(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=164(y), r7=12(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 99
LDI r1, 27
LDI r2, 261
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 164
LDI r7, 12
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
