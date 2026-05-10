; DESCRIPTION: Composite: Renders a green line between points (66, 34) and (13, 234) then Sets a single green pixel at (500, 77) then Places a cyan circle of radius 56 at center (392, 67).
; PLAN: r0=66(x1), r1=34(y1), r2=13(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=500(x), r6=77(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=392(x), r11=67(y), r12=56(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 66
LDI r1, 34
LDI r2, 13
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 500
LDI r6, 77
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 392
LDI r11, 67
LDI r12, 56
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
