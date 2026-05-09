; DESCRIPTION: Composite: Creates a red circular shape at (438, 152) with radius 74 then Places a green dot at position (249, 83) then Draws a purple line from (50, 175) to (120, 230).
; PLAN: r0=438(x), r1=152(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x), r6=83(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=50(x1), r11=175(y1), r12=120(x2), r13=230(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 152
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 83
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 50
LDI r11, 175
LDI r12, 120
LDI r13, 230
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
