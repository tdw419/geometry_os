; DESCRIPTION: Draws a cyan line from (134, 229) to (13, 31).
; PLAN: r0=134(x1), r1=229(y1), r2=13(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 229
LDI r2, 13
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
