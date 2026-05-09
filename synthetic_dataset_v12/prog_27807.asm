; DESCRIPTION: Draws a cyan line from (395, 15) to (385, 229).
; PLAN: r0=395(x1), r1=15(y1), r2=385(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 15
LDI r2, 385
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
