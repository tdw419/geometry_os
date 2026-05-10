; DESCRIPTION: Composite: Places a yellow line segment connecting (175, 102) to (196, 248) then Places a black dot at position (349, 202).
; PLAN: r0=175(x1), r1=102(y1), r2=196(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=202(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 175
LDI r1, 102
LDI r2, 196
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 202
LDI r7, 0x000000
PSET r5, r6, r7
HALT
