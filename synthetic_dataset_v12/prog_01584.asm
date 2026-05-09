; DESCRIPTION: Composite: Places a black dot at position (203, 246) then Draws a purple line from (392, 211) to (240, 165).
; PLAN: r0=203(x), r1=246(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=392(x1), r6=211(y1), r7=240(x2), r8=165(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 246
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 392
LDI r6, 211
LDI r7, 240
LDI r8, 165
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
