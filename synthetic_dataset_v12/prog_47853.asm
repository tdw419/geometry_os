; DESCRIPTION: Composite: Draws a cyan line from (110, 179) to (273, 37) then Draws a yellow circle centered at (395, 175) with radius 71.
; PLAN: r0=110(x1), r1=179(y1), r2=273(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=175(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 110
LDI r1, 179
LDI r2, 273
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 175
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
