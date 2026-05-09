; DESCRIPTION: Composite: Places a white dot at position (241, 71) then Renders a black line between points (429, 146) and (261, 87) then Places a purple 41x80 rectangle at position (382, 75).
; PLAN: r0=241(x), r1=71(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=429(x1), r6=146(y1), r7=261(x2), r8=87(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=382(x), r11=75(y), r12=41(width), r13=80(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 71
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 429
LDI r6, 146
LDI r7, 261
LDI r8, 87
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 382
LDI r11, 75
LDI r12, 41
LDI r13, 80
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
