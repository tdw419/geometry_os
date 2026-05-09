; DESCRIPTION: Draws a cyan line from (24, 251) to (220, 172).
; PLAN: r0=24(x1), r1=251(y1), r2=220(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 251
LDI r2, 220
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
