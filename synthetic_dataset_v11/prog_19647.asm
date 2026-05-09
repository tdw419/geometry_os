; DESCRIPTION: Draws a cyan line from (180, 46) to (147, 244).
; PLAN: r0=180(x1), r1=46(y1), r2=147(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 46
LDI r2, 147
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
