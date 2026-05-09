; DESCRIPTION: Composite: Sets a single white pixel at (20, 87) then Places a yellow 89x25 rectangle at position (296, 85) then Draws a white line from (107, 2) to (98, 47).
; PLAN: r0=20(x), r1=87(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=296(x), r6=85(y), r7=89(width), r8=25(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=107(x1), r11=2(y1), r12=98(x2), r13=47(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 20
LDI r1, 87
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 296
LDI r6, 85
LDI r7, 89
LDI r8, 25
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 2
LDI r12, 98
LDI r13, 47
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
