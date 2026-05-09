; DESCRIPTION: Composite: . Then Draws a green circle centered at (178, 179) with radius 15. Then Draws a magenta line from (199, 100) to (1, 111).
; PLAN: r0=178(x), r1=179(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=199(x1), r1=100(y1), r2=1(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (178, 179) with radius 15.
; PLAN: r0=178(x), r1=179(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 179
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta line from (199, 100) to (1, 111).
; PLAN: r0=199(x1), r1=100(y1), r2=1(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 100
LDI r2, 1
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
