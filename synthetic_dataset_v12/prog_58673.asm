; DESCRIPTION: Composite: Renders a purple line between points (367, 164) and (309, 69) then Places a orange circle of radius 53 at center (93, 160).
; PLAN: r0=367(x1), r1=164(y1), r2=309(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=160(y), r7=53(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 367
LDI r1, 164
LDI r2, 309
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 160
LDI r7, 53
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
