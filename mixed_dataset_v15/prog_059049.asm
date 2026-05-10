; DESCRIPTION: Composite: Creates a yellow circular shape at (466, 51) with radius 32 then Draws a white line from (351, 77) to (404, 169) then Places a yellow 93x87 rectangle at position (96, 35).
; PLAN: r0=466(x), r1=51(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=351(x1), r6=77(y1), r7=404(x2), r8=169(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=96(x), r11=35(y), r12=93(width), r13=87(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 466
LDI r1, 51
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 351
LDI r6, 77
LDI r7, 404
LDI r8, 169
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 35
LDI r12, 93
LDI r13, 87
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
