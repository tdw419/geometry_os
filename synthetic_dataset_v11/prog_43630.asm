; DESCRIPTION: Draws a green line from (65, 133) to (180, 0).
; PLAN: r0=65(x1), r1=133(y1), r2=180(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 133
LDI r2, 180
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
