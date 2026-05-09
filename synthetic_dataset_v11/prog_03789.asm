; DESCRIPTION: Draws a blue line from (180, 146) to (128, 46).
; PLAN: r0=180(x1), r1=146(y1), r2=128(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 146
LDI r2, 128
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
