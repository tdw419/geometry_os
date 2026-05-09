; DESCRIPTION: Composite: Places a orange circle of radius 38 at center (127, 144) then Places a magenta dot at position (501, 182) then Draws a white line from (349, 93) to (66, 161).
; PLAN: r0=127(x), r1=144(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=501(x), r6=182(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=349(x1), r11=93(y1), r12=66(x2), r13=161(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 144
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 501
LDI r6, 182
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 349
LDI r11, 93
LDI r12, 66
LDI r13, 161
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
