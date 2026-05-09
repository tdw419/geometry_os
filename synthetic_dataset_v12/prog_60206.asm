; DESCRIPTION: Draws a blue line from (367, 213) to (465, 212).
; PLAN: r0=367(x1), r1=213(y1), r2=465(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 213
LDI r2, 465
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
