; DESCRIPTION: Draws a blue line from (252, 243) to (217, 146).
; PLAN: r0=252(x1), r1=243(y1), r2=217(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 243
LDI r2, 217
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
