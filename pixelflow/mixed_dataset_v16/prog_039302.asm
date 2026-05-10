; DESCRIPTION: Composite: Renders a orange disk with center (429, 79) and radius 37 then Draws a cyan line from (392, 17) to (248, 142).
; PLAN: r0=429(x), r1=79(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=392(x1), r6=17(y1), r7=248(x2), r8=142(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 429
LDI r1, 79
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 392
LDI r6, 17
LDI r7, 248
LDI r8, 142
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
