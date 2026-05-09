; DESCRIPTION: Composite: . Then Draws a orange line from (39, 37) to (110, 79). Then Places a black dot at position (220, 49).
; PLAN: r0=39(x1), r1=37(y1), r2=110(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=220(x), r1=49(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange line from (39, 37) to (110, 79).
; PLAN: r0=39(x1), r1=37(y1), r2=110(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 37
LDI r2, 110
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (220, 49).
; PLAN: r0=220(x), r1=49(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 220
LDI r1, 49
LDI r2, 0x000000
PSET r0, r1, r2
HALT
