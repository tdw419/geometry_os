; DESCRIPTION: Composite: Draws a red circle centered at (267, 147) with radius 76 then Places a red dot at position (503, 234) then Draws a green line from (505, 174) to (150, 209).
; PLAN: r0=267(x), r1=147(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=503(x), r6=234(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=505(x1), r11=174(y1), r12=150(x2), r13=209(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 147
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 503
LDI r6, 234
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 505
LDI r11, 174
LDI r12, 150
LDI r13, 209
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
