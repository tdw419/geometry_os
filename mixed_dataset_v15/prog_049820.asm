; DESCRIPTION: Composite: Renders a blue disk with center (270, 101) and radius 60 then Places a red dot at position (132, 202) then Places a green line segment connecting (15, 93) to (187, 76).
; PLAN: r0=270(x), r1=101(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=202(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=15(x1), r11=93(y1), r12=187(x2), r13=76(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 101
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 202
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 15
LDI r11, 93
LDI r12, 187
LDI r13, 76
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
