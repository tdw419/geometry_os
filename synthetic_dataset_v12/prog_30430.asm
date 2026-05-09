; DESCRIPTION: Composite: Sets a single white pixel at (492, 225) then Draws a red line from (177, 199) to (433, 67) then Places a orange circle of radius 54 at center (291, 134).
; PLAN: r0=492(x), r1=225(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=177(x1), r6=199(y1), r7=433(x2), r8=67(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=291(x), r11=134(y), r12=54(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 492
LDI r1, 225
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 177
LDI r6, 199
LDI r7, 433
LDI r8, 67
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 291
LDI r11, 134
LDI r12, 54
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
