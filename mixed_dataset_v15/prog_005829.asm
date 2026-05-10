; DESCRIPTION: Composite: Places a blue line segment connecting (403, 231) to (253, 180) then Places a red dot at position (183, 60) then Places a orange circle of radius 79 at center (330, 106).
; PLAN: r0=403(x1), r1=231(y1), r2=253(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=60(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=330(x), r11=106(y), r12=79(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 403
LDI r1, 231
LDI r2, 253
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 60
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 330
LDI r11, 106
LDI r12, 79
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
