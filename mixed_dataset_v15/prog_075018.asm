; DESCRIPTION: Composite: Places a magenta line segment connecting (128, 26) to (423, 35) then Draws a cyan circle centered at (126, 111) with radius 77.
; PLAN: r0=128(x1), r1=26(y1), r2=423(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=111(y), r7=77(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 128
LDI r1, 26
LDI r2, 423
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 111
LDI r7, 77
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
