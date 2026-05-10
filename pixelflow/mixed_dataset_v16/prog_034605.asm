; DESCRIPTION: Composite: Places a cyan circle of radius 17 at center (301, 132) then Renders a orange line between points (260, 227) and (339, 119) then Places a magenta dot at position (123, 177).
; PLAN: r0=301(x), r1=132(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x1), r6=227(y1), r7=339(x2), r8=119(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=123(x), r11=177(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 301
LDI r1, 132
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 227
LDI r7, 339
LDI r8, 119
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 177
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
