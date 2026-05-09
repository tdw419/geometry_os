; DESCRIPTION: Draws a cyan line from (105, 229) to (19, 163).
; PLAN: r0=105(x1), r1=229(y1), r2=19(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 229
LDI r2, 19
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
