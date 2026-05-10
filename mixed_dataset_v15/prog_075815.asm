; DESCRIPTION: Composite: Draws a black rectangle at (345, 84) with width 81 and height 120 then Draws a white line from (8, 8) to (37, 47) then Places a red dot at position (458, 52).
; PLAN: r0=345(x), r1=84(y), r2=81(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=8(x1), r6=8(y1), r7=37(x2), r8=47(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=458(x), r11=52(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 345
LDI r1, 84
LDI r2, 81
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 8
LDI r6, 8
LDI r7, 37
LDI r8, 47
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 458
LDI r11, 52
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
