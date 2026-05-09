; DESCRIPTION: Draws a cyan line from (27, 157) to (318, 145).
; PLAN: r0=27(x1), r1=157(y1), r2=318(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 157
LDI r2, 318
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
