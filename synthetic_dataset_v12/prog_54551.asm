; DESCRIPTION: Composite: Renders a black disk with center (98, 90) and radius 44 then Places a cyan dot at position (489, 247) then Draws a cyan line from (108, 35) to (72, 173).
; PLAN: r0=98(x), r1=90(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=489(x), r6=247(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=108(x1), r11=35(y1), r12=72(x2), r13=173(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 98
LDI r1, 90
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 489
LDI r6, 247
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 108
LDI r11, 35
LDI r12, 72
LDI r13, 173
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
