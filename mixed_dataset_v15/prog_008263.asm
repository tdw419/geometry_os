; DESCRIPTION: Composite: Draws a cyan line from (5, 71) to (408, 95) then Draws a cyan rectangle at (321, 125) with width 89 and height 86 then Sets a single cyan pixel at (425, 120).
; PLAN: r0=5(x1), r1=71(y1), r2=408(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=321(x), r6=125(y), r7=89(width), r8=86(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=425(x), r11=120(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 5
LDI r1, 71
LDI r2, 408
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 125
LDI r7, 89
LDI r8, 86
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 120
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
