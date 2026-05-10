; DESCRIPTION: Composite: Places a cyan dot at position (417, 83) then Places a orange circle of radius 25 at center (57, 58) then Places a yellow line segment connecting (243, 229) to (342, 108).
; PLAN: r0=417(x), r1=83(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=57(x), r6=58(y), r7=25(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=243(x1), r11=229(y1), r12=342(x2), r13=108(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 83
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 57
LDI r6, 58
LDI r7, 25
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 243
LDI r11, 229
LDI r12, 342
LDI r13, 108
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
