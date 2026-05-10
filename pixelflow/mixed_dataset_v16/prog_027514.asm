; DESCRIPTION: Composite: Renders a white line between points (418, 38) and (316, 110) then Renders a purple box of size 20x18 starting at (13, 64) then Places a white dot at position (277, 135).
; PLAN: r0=418(x1), r1=38(y1), r2=316(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=13(x), r6=64(y), r7=20(width), r8=18(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=277(x), r11=135(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 418
LDI r1, 38
LDI r2, 316
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 64
LDI r7, 20
LDI r8, 18
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 277
LDI r11, 135
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
