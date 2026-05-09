; DESCRIPTION: Composite: Draws a white line from (230, 70) to (190, 144) then Places a cyan dot at position (481, 85).
; PLAN: r0=230(x1), r1=70(y1), r2=190(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=481(x), r6=85(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 230
LDI r1, 70
LDI r2, 190
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 85
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
