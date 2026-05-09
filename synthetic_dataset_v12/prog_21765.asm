; DESCRIPTION: Composite: Places a green dot at position (373, 97) then Draws a black line from (122, 222) to (176, 33).
; PLAN: r0=373(x), r1=97(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=122(x1), r6=222(y1), r7=176(x2), r8=33(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 97
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 122
LDI r6, 222
LDI r7, 176
LDI r8, 33
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
