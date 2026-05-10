; DESCRIPTION: Composite: Creates a white circular shape at (198, 160) with radius 61 then Places a yellow dot at position (301, 109) then Places a white line segment connecting (302, 21) to (106, 226).
; PLAN: r0=198(x), r1=160(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x), r6=109(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=302(x1), r11=21(y1), r12=106(x2), r13=226(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 198
LDI r1, 160
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 109
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 302
LDI r11, 21
LDI r12, 106
LDI r13, 226
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
