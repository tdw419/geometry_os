; DESCRIPTION: Composite: Renders a cyan disk with center (230, 103) and radius 60 then Renders a yellow line between points (321, 208) and (61, 57) then Sets a single yellow pixel at (108, 96).
; PLAN: r0=230(x), r1=103(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x1), r6=208(y1), r7=61(x2), r8=57(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=108(x), r11=96(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 230
LDI r1, 103
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 208
LDI r7, 61
LDI r8, 57
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 96
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
