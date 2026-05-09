; DESCRIPTION: Composite: Renders a purple disk with center (119, 94) and radius 20 then Places a magenta dot at position (307, 125) then Places a yellow line segment connecting (66, 253) to (238, 174).
; PLAN: r0=119(x), r1=94(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=125(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=66(x1), r11=253(y1), r12=238(x2), r13=174(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 94
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 125
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 66
LDI r11, 253
LDI r12, 238
LDI r13, 174
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
