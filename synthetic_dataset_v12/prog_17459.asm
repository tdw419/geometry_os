; DESCRIPTION: Composite: Places a orange line segment connecting (370, 42) to (158, 66) then Places a cyan dot at position (436, 15).
; PLAN: r0=370(x1), r1=42(y1), r2=158(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=436(x), r6=15(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 370
LDI r1, 42
LDI r2, 158
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 15
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
