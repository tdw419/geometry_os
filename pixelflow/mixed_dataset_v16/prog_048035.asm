; DESCRIPTION: Draws a cyan line from (13, 212) to (238, 86).
; PLAN: r0=13(x1), r1=212(y1), r2=238(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 212
LDI r2, 238
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
