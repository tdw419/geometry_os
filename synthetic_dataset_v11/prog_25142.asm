; DESCRIPTION: Draws a green line from (76, 127) to (180, 8).
; PLAN: r0=76(x1), r1=127(y1), r2=180(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 127
LDI r2, 180
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
