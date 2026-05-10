; DESCRIPTION: Composite: Draws a green line from (64, 92) to (370, 235) then Draws a white rectangle at (433, 152) with width 35 and height 76 then Sets a single purple pixel at (213, 241).
; PLAN: r0=64(x1), r1=92(y1), r2=370(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=152(y), r7=35(width), r8=76(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=213(x), r11=241(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 64
LDI r1, 92
LDI r2, 370
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 152
LDI r7, 35
LDI r8, 76
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 241
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
