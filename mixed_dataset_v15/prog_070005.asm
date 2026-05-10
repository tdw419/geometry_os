; DESCRIPTION: Composite: Renders a yellow line between points (449, 192) and (280, 110) then Places a cyan dot at position (395, 221).
; PLAN: r0=449(x1), r1=192(y1), r2=280(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=221(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 449
LDI r1, 192
LDI r2, 280
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 221
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
