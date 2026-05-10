; DESCRIPTION: Composite: Places a yellow circle of radius 41 at center (347, 173) then Draws a red line from (157, 83) to (70, 187).
; PLAN: r0=347(x), r1=173(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x1), r6=83(y1), r7=70(x2), r8=187(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 173
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 83
LDI r7, 70
LDI r8, 187
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
