; DESCRIPTION: Composite: Places a cyan circle of radius 38 at center (91, 186) then Renders a yellow line between points (324, 197) and (160, 250) then Places a green dot at position (410, 155).
; PLAN: r0=91(x), r1=186(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=324(x1), r6=197(y1), r7=160(x2), r8=250(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=410(x), r11=155(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 91
LDI r1, 186
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 324
LDI r6, 197
LDI r7, 160
LDI r8, 250
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 155
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
