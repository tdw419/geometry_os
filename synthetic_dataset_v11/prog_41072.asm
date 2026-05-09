; DESCRIPTION: Draws a cyan line from (139, 236) to (6, 220).
; PLAN: r0=139(x1), r1=236(y1), r2=6(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 236
LDI r2, 6
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
