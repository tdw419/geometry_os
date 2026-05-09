; DESCRIPTION: Composite: Places a purple circle of radius 30 at center (381, 206) then Places a magenta line segment connecting (319, 40) to (69, 25).
; PLAN: r0=381(x), r1=206(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=319(x1), r6=40(y1), r7=69(x2), r8=25(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 206
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 319
LDI r6, 40
LDI r7, 69
LDI r8, 25
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
