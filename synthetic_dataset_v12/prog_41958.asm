; DESCRIPTION: Composite: Renders a yellow line between points (0, 129) and (313, 121) then Sets a single cyan pixel at (83, 160).
; PLAN: r0=0(x1), r1=129(y1), r2=313(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=160(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 0
LDI r1, 129
LDI r2, 313
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 160
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
