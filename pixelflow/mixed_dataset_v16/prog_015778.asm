; DESCRIPTION: Composite: Renders a magenta line between points (425, 110) and (342, 215) then Renders a blue disk with center (387, 174) and radius 57 then Places a purple dot at position (185, 86).
; PLAN: r0=425(x1), r1=110(y1), r2=342(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=387(x), r6=174(y), r7=57(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=185(x), r11=86(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 425
LDI r1, 110
LDI r2, 342
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 174
LDI r7, 57
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 185
LDI r11, 86
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
