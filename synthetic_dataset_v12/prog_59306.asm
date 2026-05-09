; DESCRIPTION: Draws a cyan line from (461, 65) to (447, 229).
; PLAN: r0=461(x1), r1=65(y1), r2=447(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 65
LDI r2, 447
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
