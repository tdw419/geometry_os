; DESCRIPTION: Composite: Places a red 41x38 rectangle at position (347, 131) then Draws a white line from (344, 60) to (441, 126) then Places a cyan dot at position (294, 194).
; PLAN: r0=347(x), r1=131(y), r2=41(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x1), r6=60(y1), r7=441(x2), r8=126(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=294(x), r11=194(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 347
LDI r1, 131
LDI r2, 41
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 60
LDI r7, 441
LDI r8, 126
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 294
LDI r11, 194
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
