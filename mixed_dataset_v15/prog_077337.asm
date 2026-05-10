; DESCRIPTION: Composite: Draws a cyan line from (416, 142) to (339, 176) then Renders a red disk with center (437, 98) and radius 25 then Places a green dot at position (468, 66).
; PLAN: r0=416(x1), r1=142(y1), r2=339(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=437(x), r6=98(y), r7=25(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=468(x), r11=66(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 416
LDI r1, 142
LDI r2, 339
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 98
LDI r7, 25
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 468
LDI r11, 66
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
