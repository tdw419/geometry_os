; DESCRIPTION: Composite: Places a magenta line segment connecting (324, 64) to (309, 126) then Draws a white circle centered at (345, 100) with radius 51.
; PLAN: r0=324(x1), r1=64(y1), r2=309(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=100(y), r7=51(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 324
LDI r1, 64
LDI r2, 309
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 100
LDI r7, 51
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
