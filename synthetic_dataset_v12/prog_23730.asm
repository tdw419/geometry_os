; DESCRIPTION: Draws a cyan line from (43, 181) to (439, 110).
; PLAN: r0=43(x1), r1=181(y1), r2=439(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 181
LDI r2, 439
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
