; DESCRIPTION: Composite: Draws a white circle centered at (345, 143) with radius 73 then Places a white dot at position (79, 188) then Draws a green line from (286, 73) to (292, 165).
; PLAN: r0=345(x), r1=143(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=79(x), r6=188(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=286(x1), r11=73(y1), r12=292(x2), r13=165(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 143
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 79
LDI r6, 188
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 286
LDI r11, 73
LDI r12, 292
LDI r13, 165
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
