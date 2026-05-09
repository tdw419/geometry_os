; DESCRIPTION: Draws a cyan line from (82, 159) to (40, 185).
; PLAN: r0=82(x1), r1=159(y1), r2=40(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 159
LDI r2, 40
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
