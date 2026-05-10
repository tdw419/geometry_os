; DESCRIPTION: Composite: Draws a red circle centered at (124, 195) with radius 49 then Sets a single white pixel at (329, 48) then Renders a blue line between points (361, 103) and (300, 143).
; PLAN: r0=124(x), r1=195(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x), r6=48(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=361(x1), r11=103(y1), r12=300(x2), r13=143(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 124
LDI r1, 195
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 48
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 361
LDI r11, 103
LDI r12, 300
LDI r13, 143
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
