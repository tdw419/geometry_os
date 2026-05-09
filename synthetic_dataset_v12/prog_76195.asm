; DESCRIPTION: Composite: Places a black dot at position (439, 39) then Draws a purple circle centered at (209, 75) with radius 26 then Draws a cyan line from (387, 61) to (69, 140).
; PLAN: r0=439(x), r1=39(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=209(x), r6=75(y), r7=26(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=387(x1), r11=61(y1), r12=69(x2), r13=140(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 439
LDI r1, 39
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 209
LDI r6, 75
LDI r7, 26
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 387
LDI r11, 61
LDI r12, 69
LDI r13, 140
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
