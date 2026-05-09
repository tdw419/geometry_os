; DESCRIPTION: Composite: Draws a purple circle centered at (401, 125) with radius 69 then Draws a red line from (411, 222) to (284, 177).
; PLAN: r0=401(x), r1=125(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x1), r6=222(y1), r7=284(x2), r8=177(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 125
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 222
LDI r7, 284
LDI r8, 177
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
