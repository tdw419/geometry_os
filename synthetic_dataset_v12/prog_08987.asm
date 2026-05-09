; DESCRIPTION: Composite: Draws a blue line from (339, 231) to (426, 126) then Creates a blue circular shape at (354, 174) with radius 80 then Places a red dot at position (277, 109).
; PLAN: r0=339(x1), r1=231(y1), r2=426(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=354(x), r6=174(y), r7=80(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=277(x), r11=109(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 339
LDI r1, 231
LDI r2, 426
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 174
LDI r7, 80
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 277
LDI r11, 109
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
