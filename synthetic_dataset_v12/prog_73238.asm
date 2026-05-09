; DESCRIPTION: Composite: Draws a cyan line from (432, 25) to (16, 73) then Places a white dot at position (472, 171).
; PLAN: r0=432(x1), r1=25(y1), r2=16(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=472(x), r6=171(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 432
LDI r1, 25
LDI r2, 16
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 171
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
