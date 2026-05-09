; DESCRIPTION: Draws a purple line from (168, 198) to (481, 146).
; PLAN: r0=168(x1), r1=198(y1), r2=481(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 198
LDI r2, 481
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
