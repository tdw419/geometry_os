; DESCRIPTION: Composite: Places a orange circle of radius 44 at center (99, 79) then Places a red dot at position (275, 42) then Renders a red line between points (345, 163) and (307, 53).
; PLAN: r0=99(x), r1=79(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=275(x), r6=42(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=345(x1), r11=163(y1), r12=307(x2), r13=53(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 99
LDI r1, 79
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 275
LDI r6, 42
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 345
LDI r11, 163
LDI r12, 307
LDI r13, 53
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
