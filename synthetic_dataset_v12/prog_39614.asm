; DESCRIPTION: Composite: Places a green dot at position (464, 35) then Renders a red disk with center (285, 35) and radius 33 then Draws a purple line from (317, 225) to (178, 208).
; PLAN: r0=464(x), r1=35(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=285(x), r6=35(y), r7=33(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=317(x1), r11=225(y1), r12=178(x2), r13=208(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 464
LDI r1, 35
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 285
LDI r6, 35
LDI r7, 33
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 317
LDI r11, 225
LDI r12, 178
LDI r13, 208
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
