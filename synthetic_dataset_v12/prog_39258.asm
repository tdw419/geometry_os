; DESCRIPTION: Composite: Renders a red line between points (31, 79) and (410, 44) then Creates a purple circular shape at (365, 154) with radius 50 then Sets a single yellow pixel at (449, 224).
; PLAN: r0=31(x1), r1=79(y1), r2=410(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=365(x), r6=154(y), r7=50(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=449(x), r11=224(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 31
LDI r1, 79
LDI r2, 410
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 154
LDI r7, 50
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 449
LDI r11, 224
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
