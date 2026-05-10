; DESCRIPTION: Composite: Draws a black line from (445, 108) to (98, 25) then Places a red dot at position (125, 42).
; PLAN: r0=445(x1), r1=108(y1), r2=98(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=42(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 445
LDI r1, 108
LDI r2, 98
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 42
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
