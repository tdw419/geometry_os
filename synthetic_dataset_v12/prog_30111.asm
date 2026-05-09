; DESCRIPTION: Composite: Draws a red line from (215, 41) to (250, 25) then Places a white dot at position (239, 56).
; PLAN: r0=215(x1), r1=41(y1), r2=250(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=56(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 215
LDI r1, 41
LDI r2, 250
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 56
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
