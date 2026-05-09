; DESCRIPTION: Composite: Places a magenta circle of radius 74 at center (75, 114) then Places a white dot at position (311, 31) then Renders a red line between points (383, 72) and (130, 107).
; PLAN: r0=75(x), r1=114(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x), r6=31(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=383(x1), r11=72(y1), r12=130(x2), r13=107(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 114
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 31
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 383
LDI r11, 72
LDI r12, 130
LDI r13, 107
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
