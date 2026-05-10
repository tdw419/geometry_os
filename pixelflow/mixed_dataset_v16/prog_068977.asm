; DESCRIPTION: Composite: Places a white 74x94 rectangle at position (311, 77) then Places a green dot at position (94, 235) then Draws a purple line from (503, 217) to (257, 19).
; PLAN: r0=311(x), r1=77(y), r2=74(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=94(x), r6=235(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=503(x1), r11=217(y1), r12=257(x2), r13=19(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 77
LDI r2, 74
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 235
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 503
LDI r11, 217
LDI r12, 257
LDI r13, 19
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
