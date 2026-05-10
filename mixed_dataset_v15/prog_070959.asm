; DESCRIPTION: Composite: Places a orange circle of radius 40 at center (338, 68) then Places a red dot at position (352, 103) then Renders a blue line between points (503, 66) and (388, 85).
; PLAN: r0=338(x), r1=68(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x), r6=103(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=503(x1), r11=66(y1), r12=388(x2), r13=85(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 68
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 103
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 503
LDI r11, 66
LDI r12, 388
LDI r13, 85
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
