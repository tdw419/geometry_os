; DESCRIPTION: Draws a cyan line from (147, 57) to (146, 10).
; PLAN: r0=147(x1), r1=57(y1), r2=146(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 57
LDI r2, 146
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
