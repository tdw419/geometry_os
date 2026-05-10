; DESCRIPTION: Composite: Places a purple circle of radius 36 at center (125, 68) then Sets a single purple pixel at (125, 181) then Renders a cyan line between points (307, 208) and (339, 220).
; PLAN: r0=125(x), r1=68(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=125(x), r6=181(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=307(x1), r11=208(y1), r12=339(x2), r13=220(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 68
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 125
LDI r6, 181
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 307
LDI r11, 208
LDI r12, 339
LDI r13, 220
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
