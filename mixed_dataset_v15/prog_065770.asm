; DESCRIPTION: Composite: Draws a red circle centered at (34, 105) with radius 16 then Places a red dot at position (367, 35) then Renders a white line between points (118, 221) and (75, 249).
; PLAN: r0=34(x), r1=105(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x), r6=35(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=118(x1), r11=221(y1), r12=75(x2), r13=249(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 34
LDI r1, 105
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 35
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 118
LDI r11, 221
LDI r12, 75
LDI r13, 249
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
