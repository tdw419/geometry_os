; DESCRIPTION: Composite: Draws a white line from (119, 141) to (180, 108) then Places a yellow circle of radius 66 at center (345, 107).
; PLAN: r0=119(x1), r1=141(y1), r2=180(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=107(y), r7=66(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 119
LDI r1, 141
LDI r2, 180
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 107
LDI r7, 66
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
