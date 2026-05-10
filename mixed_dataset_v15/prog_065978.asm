; DESCRIPTION: Composite: Draws a red line from (303, 165) to (45, 184) then Creates a red circular shape at (297, 194) with radius 14 then Places a yellow dot at position (388, 57).
; PLAN: r0=303(x1), r1=165(y1), r2=45(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=194(y), r7=14(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=388(x), r11=57(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 303
LDI r1, 165
LDI r2, 45
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 194
LDI r7, 14
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 388
LDI r11, 57
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
