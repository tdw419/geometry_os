; DESCRIPTION: Composite: Places a cyan line segment connecting (510, 206) to (106, 237) then Places a purple dot at position (176, 203) then Places a green circle of radius 61 at center (422, 122).
; PLAN: r0=510(x1), r1=206(y1), r2=106(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=203(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=422(x), r11=122(y), r12=61(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 510
LDI r1, 206
LDI r2, 106
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 203
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 422
LDI r11, 122
LDI r12, 61
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
