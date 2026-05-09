; DESCRIPTION: Draws a cyan line from (133, 117) to (0, 79).
; PLAN: r0=133(x1), r1=117(y1), r2=0(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 117
LDI r2, 0
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
