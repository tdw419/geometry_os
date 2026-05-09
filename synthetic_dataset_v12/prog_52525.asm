; DESCRIPTION: Draws a cyan line from (86, 248) to (153, 229).
; PLAN: r0=86(x1), r1=248(y1), r2=153(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 248
LDI r2, 153
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
