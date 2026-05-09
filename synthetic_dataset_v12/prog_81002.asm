; DESCRIPTION: Composite: Draws a green line from (162, 95) to (99, 200) then Renders a cyan disk with center (378, 60) and radius 56 then Places a cyan dot at position (204, 58).
; PLAN: r0=162(x1), r1=95(y1), r2=99(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=60(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=204(x), r11=58(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 162
LDI r1, 95
LDI r2, 99
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 60
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 204
LDI r11, 58
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
