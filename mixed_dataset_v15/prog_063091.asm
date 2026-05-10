; DESCRIPTION: Draws a magenta line from (149, 76) to (32, 146).
; PLAN: r0=149(x1), r1=76(y1), r2=32(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 76
LDI r2, 32
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
