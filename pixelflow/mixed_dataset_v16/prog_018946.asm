; DESCRIPTION: Composite: Draws a cyan line from (469, 237) to (185, 171) then Draws a white circle centered at (143, 159) with radius 13.
; PLAN: r0=469(x1), r1=237(y1), r2=185(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=159(y), r7=13(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 469
LDI r1, 237
LDI r2, 185
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 159
LDI r7, 13
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
