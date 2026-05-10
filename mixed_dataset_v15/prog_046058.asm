; DESCRIPTION: Composite: Renders a orange disk with center (253, 127) and radius 79 then Places a orange line segment connecting (406, 41) to (188, 164).
; PLAN: r0=253(x), r1=127(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x1), r6=41(y1), r7=188(x2), r8=164(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 127
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 41
LDI r7, 188
LDI r8, 164
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
