; DESCRIPTION: Draws a cyan line from (226, 35) to (390, 57).
; PLAN: r0=226(x1), r1=35(y1), r2=390(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 35
LDI r2, 390
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
