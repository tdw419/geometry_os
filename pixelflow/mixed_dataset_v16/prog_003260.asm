; DESCRIPTION: Draws a cyan line from (146, 189) to (222, 90).
; PLAN: r0=146(x1), r1=189(y1), r2=222(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 189
LDI r2, 222
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
