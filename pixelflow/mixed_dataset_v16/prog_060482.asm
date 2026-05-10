; DESCRIPTION: Composite: Places a blue line segment connecting (185, 176) to (209, 65) then Places a white dot at position (428, 175).
; PLAN: r0=185(x1), r1=176(y1), r2=209(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=175(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 185
LDI r1, 176
LDI r2, 209
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 175
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
