; DESCRIPTION: Composite: Draws a orange rectangle at (330, 57) with width 100 and height 115 then Renders a green line between points (461, 143) and (365, 58) then Places a black dot at position (125, 44).
; PLAN: r0=330(x), r1=57(y), r2=100(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=461(x1), r6=143(y1), r7=365(x2), r8=58(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=125(x), r11=44(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 330
LDI r1, 57
LDI r2, 100
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 143
LDI r7, 365
LDI r8, 58
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 125
LDI r11, 44
LDI r12, 0x000000
PSET r10, r11, r12
HALT
