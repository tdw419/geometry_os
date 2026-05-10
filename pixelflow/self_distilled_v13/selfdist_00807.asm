; DESCRIPTION: Draws a cyan line from (323, 117) to (4, 15).
; PLAN: r0=323(x1), r1=117(y1), r2=4(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 117
LDI r2, 4
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
