; DESCRIPTION: Composite: Places a green dot at position (197, 80) then Renders a orange disk with center (164, 94) and radius 33 then Draws a orange line from (456, 229) to (348, 96).
; PLAN: r0=197(x), r1=80(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=164(x), r6=94(y), r7=33(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=456(x1), r11=229(y1), r12=348(x2), r13=96(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 80
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 164
LDI r6, 94
LDI r7, 33
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 456
LDI r11, 229
LDI r12, 348
LDI r13, 96
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
