; DESCRIPTION: Composite: Sets a single blue pixel at (445, 154) then Draws a red circle centered at (362, 120) with radius 53 then Places a red line segment connecting (155, 210) to (326, 245).
; PLAN: r0=445(x), r1=154(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=362(x), r6=120(y), r7=53(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=155(x1), r11=210(y1), r12=326(x2), r13=245(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 445
LDI r1, 154
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 362
LDI r6, 120
LDI r7, 53
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 155
LDI r11, 210
LDI r12, 326
LDI r13, 245
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
