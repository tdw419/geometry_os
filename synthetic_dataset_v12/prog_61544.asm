; DESCRIPTION: Composite: Creates a black circular shape at (400, 34) with radius 13 then Sets a single orange pixel at (479, 152) then Draws a red line from (291, 85) to (164, 246).
; PLAN: r0=400(x), r1=34(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=479(x), r6=152(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=291(x1), r11=85(y1), r12=164(x2), r13=246(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 34
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 479
LDI r6, 152
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 291
LDI r11, 85
LDI r12, 164
LDI r13, 246
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
