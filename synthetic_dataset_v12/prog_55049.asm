; DESCRIPTION: Composite: Sets a single orange pixel at (244, 8) then Places a magenta line segment connecting (284, 123) to (142, 159).
; PLAN: r0=244(x), r1=8(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=284(x1), r6=123(y1), r7=142(x2), r8=159(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 8
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 284
LDI r6, 123
LDI r7, 142
LDI r8, 159
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
