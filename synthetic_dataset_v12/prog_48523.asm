; DESCRIPTION: Composite: Renders a purple line between points (492, 94) and (383, 101) then Places a cyan dot at position (198, 206).
; PLAN: r0=492(x1), r1=94(y1), r2=383(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=198(x), r6=206(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 492
LDI r1, 94
LDI r2, 383
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 206
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
