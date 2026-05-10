; DESCRIPTION: Composite: Places a purple circle of radius 55 at center (395, 110) then Renders a cyan line between points (117, 107) and (370, 193).
; PLAN: r0=395(x), r1=110(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=117(x1), r6=107(y1), r7=370(x2), r8=193(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 110
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 117
LDI r6, 107
LDI r7, 370
LDI r8, 193
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
