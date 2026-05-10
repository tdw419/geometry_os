; DESCRIPTION: Composite: Creates a blue circular shape at (409, 132) with radius 57 then Draws a magenta line from (429, 62) to (4, 182).
; PLAN: r0=409(x), r1=132(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=429(x1), r6=62(y1), r7=4(x2), r8=182(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 132
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 429
LDI r6, 62
LDI r7, 4
LDI r8, 182
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
