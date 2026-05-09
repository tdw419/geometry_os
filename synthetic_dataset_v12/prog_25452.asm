; DESCRIPTION: Composite: Places a red line segment connecting (73, 83) to (94, 129) then Renders a cyan disk with center (84, 199) and radius 11 then Places a red dot at position (1, 131).
; PLAN: r0=73(x1), r1=83(y1), r2=94(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=199(y), r7=11(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=1(x), r11=131(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 73
LDI r1, 83
LDI r2, 94
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 199
LDI r7, 11
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 1
LDI r11, 131
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
