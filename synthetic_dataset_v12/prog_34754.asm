; DESCRIPTION: Composite: Creates a cyan circular shape at (240, 98) with radius 51 then Places a yellow line segment connecting (350, 117) to (350, 206).
; PLAN: r0=240(x), r1=98(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x1), r6=117(y1), r7=350(x2), r8=206(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 98
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 117
LDI r7, 350
LDI r8, 206
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
