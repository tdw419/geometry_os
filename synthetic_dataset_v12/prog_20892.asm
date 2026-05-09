; DESCRIPTION: Composite: Renders a purple disk with center (451, 145) and radius 61 then Draws a yellow line from (226, 206) to (422, 64) then Places a yellow dot at position (125, 0).
; PLAN: r0=451(x), r1=145(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x1), r6=206(y1), r7=422(x2), r8=64(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=125(x), r11=0(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 451
LDI r1, 145
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 206
LDI r7, 422
LDI r8, 64
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 125
LDI r11, 0
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
