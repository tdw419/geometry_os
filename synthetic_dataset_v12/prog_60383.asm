; DESCRIPTION: Composite: Draws a blue circle centered at (398, 197) with radius 59 then Renders a green line between points (454, 109) and (354, 59) then Sets a single black pixel at (274, 166).
; PLAN: r0=398(x), r1=197(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=454(x1), r6=109(y1), r7=354(x2), r8=59(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=274(x), r11=166(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 398
LDI r1, 197
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 454
LDI r6, 109
LDI r7, 354
LDI r8, 59
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 166
LDI r12, 0x000000
PSET r10, r11, r12
HALT
