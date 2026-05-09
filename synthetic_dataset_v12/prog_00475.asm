; DESCRIPTION: Composite: Draws a white circle centered at (284, 195) with radius 49 then Draws a black line from (367, 235) to (384, 70) then Sets a single black pixel at (176, 4).
; PLAN: r0=284(x), r1=195(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x1), r6=235(y1), r7=384(x2), r8=70(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=176(x), r11=4(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 284
LDI r1, 195
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 235
LDI r7, 384
LDI r8, 70
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 4
LDI r12, 0x000000
PSET r10, r11, r12
HALT
