; DESCRIPTION: Composite: Sets a single black pixel at (411, 189) then Renders a orange disk with center (226, 197) and radius 44 then Draws a cyan line from (371, 79) to (443, 111).
; PLAN: r0=411(x), r1=189(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=226(x), r6=197(y), r7=44(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=371(x1), r11=79(y1), r12=443(x2), r13=111(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 411
LDI r1, 189
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 226
LDI r6, 197
LDI r7, 44
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 371
LDI r11, 79
LDI r12, 443
LDI r13, 111
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
