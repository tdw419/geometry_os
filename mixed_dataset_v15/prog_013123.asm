; DESCRIPTION: Draws a cyan line from (146, 192) to (427, 123).
; PLAN: r0=146(x1), r1=192(y1), r2=427(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 192
LDI r2, 427
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
