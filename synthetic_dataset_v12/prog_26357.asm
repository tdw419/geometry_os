; DESCRIPTION: Composite: Draws a orange line from (335, 39) to (163, 202) then Places a green circle of radius 13 at center (72, 193).
; PLAN: r0=335(x1), r1=39(y1), r2=163(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=193(y), r7=13(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 335
LDI r1, 39
LDI r2, 163
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 193
LDI r7, 13
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
