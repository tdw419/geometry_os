; DESCRIPTION: Composite: Sets a single red pixel at (199, 185) then Draws a white line from (122, 206) to (360, 29) then Draws a magenta circle centered at (400, 114) with radius 39.
; PLAN: r0=199(x), r1=185(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=122(x1), r6=206(y1), r7=360(x2), r8=29(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=400(x), r11=114(y), r12=39(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 199
LDI r1, 185
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 122
LDI r6, 206
LDI r7, 360
LDI r8, 29
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 400
LDI r11, 114
LDI r12, 39
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
