; DESCRIPTION: Composite: Places a blue circle of radius 22 at center (301, 86) then Renders a orange line between points (48, 208) and (405, 33) then Places a black dot at position (197, 169).
; PLAN: r0=301(x), r1=86(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x1), r6=208(y1), r7=405(x2), r8=33(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=197(x), r11=169(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 301
LDI r1, 86
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 208
LDI r7, 405
LDI r8, 33
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 169
LDI r12, 0x000000
PSET r10, r11, r12
HALT
