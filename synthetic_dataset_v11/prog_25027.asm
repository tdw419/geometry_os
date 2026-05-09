; DESCRIPTION: Draws a cyan line from (123, 46) to (248, 229).
; PLAN: r0=123(x1), r1=46(y1), r2=248(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 46
LDI r2, 248
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
