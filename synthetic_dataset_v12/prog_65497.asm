; DESCRIPTION: Composite: Places a green dot at position (193, 250) then Places a green circle of radius 43 at center (387, 82) then Renders a blue line between points (466, 55) and (262, 60).
; PLAN: r0=193(x), r1=250(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=387(x), r6=82(y), r7=43(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=466(x1), r11=55(y1), r12=262(x2), r13=60(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 193
LDI r1, 250
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 387
LDI r6, 82
LDI r7, 43
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 466
LDI r11, 55
LDI r12, 262
LDI r13, 60
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
