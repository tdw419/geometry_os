; DESCRIPTION: Composite: Draws a cyan line from (372, 48) to (238, 227) then Draws a red rectangle at (296, 120) with width 98 and height 53 then Sets a single red pixel at (425, 121).
; PLAN: r0=372(x1), r1=48(y1), r2=238(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=120(y), r7=98(width), r8=53(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=425(x), r11=121(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 372
LDI r1, 48
LDI r2, 238
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 120
LDI r7, 98
LDI r8, 53
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 121
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
