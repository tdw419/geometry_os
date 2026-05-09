; DESCRIPTION: Composite: Creates a magenta circular shape at (395, 178) with radius 18 then Places a blue line segment connecting (143, 241) to (202, 44).
; PLAN: r0=395(x), r1=178(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=143(x1), r6=241(y1), r7=202(x2), r8=44(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 178
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 143
LDI r6, 241
LDI r7, 202
LDI r8, 44
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
