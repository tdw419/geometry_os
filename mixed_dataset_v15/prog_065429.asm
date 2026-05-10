; DESCRIPTION: Composite: Draws a red circle centered at (448, 47) with radius 39 then Places a yellow dot at position (403, 186) then Renders a purple line between points (374, 113) and (413, 32).
; PLAN: r0=448(x), r1=47(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=403(x), r6=186(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=374(x1), r11=113(y1), r12=413(x2), r13=32(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 448
LDI r1, 47
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 403
LDI r6, 186
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 374
LDI r11, 113
LDI r12, 413
LDI r13, 32
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
