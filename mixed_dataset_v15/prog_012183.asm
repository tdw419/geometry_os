; DESCRIPTION: Composite: Renders a green line between points (111, 31) and (110, 65) then Renders a cyan disk with center (260, 105) and radius 21 then Places a cyan dot at position (304, 7).
; PLAN: r0=111(x1), r1=31(y1), r2=110(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=105(y), r7=21(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=304(x), r11=7(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 111
LDI r1, 31
LDI r2, 110
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 105
LDI r7, 21
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 304
LDI r11, 7
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
