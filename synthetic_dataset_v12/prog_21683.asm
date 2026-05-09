; DESCRIPTION: Composite: Places a purple line segment connecting (332, 79) to (470, 24) then Places a magenta dot at position (304, 29).
; PLAN: r0=332(x1), r1=79(y1), r2=470(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=29(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 332
LDI r1, 79
LDI r2, 470
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 29
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
