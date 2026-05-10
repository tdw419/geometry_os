; DESCRIPTION: Composite: Sets a single yellow pixel at (190, 164) then Places a cyan circle of radius 72 at center (331, 127) then Draws a cyan line from (464, 255) to (321, 4).
; PLAN: r0=190(x), r1=164(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=331(x), r6=127(y), r7=72(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=464(x1), r11=255(y1), r12=321(x2), r13=4(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 164
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 331
LDI r6, 127
LDI r7, 72
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 464
LDI r11, 255
LDI r12, 321
LDI r13, 4
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
