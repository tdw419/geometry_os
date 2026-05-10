; DESCRIPTION: Composite: Draws a yellow line from (279, 100) to (510, 129) then Places a white circle of radius 73 at center (372, 133) then Places a cyan dot at position (155, 192).
; PLAN: r0=279(x1), r1=100(y1), r2=510(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=133(y), r7=73(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=155(x), r11=192(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 279
LDI r1, 100
LDI r2, 510
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 133
LDI r7, 73
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 155
LDI r11, 192
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
