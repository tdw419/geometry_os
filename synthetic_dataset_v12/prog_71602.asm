; DESCRIPTION: Composite: Renders a purple disk with center (392, 221) and radius 19 then Draws a purple line from (197, 177) to (94, 81) then Sets a single cyan pixel at (227, 44).
; PLAN: r0=392(x), r1=221(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=197(x1), r6=177(y1), r7=94(x2), r8=81(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=227(x), r11=44(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 392
LDI r1, 221
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 197
LDI r6, 177
LDI r7, 94
LDI r8, 81
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 227
LDI r11, 44
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
