; DESCRIPTION: Draws a purple line from (220, 146) to (367, 71).
; PLAN: r0=220(x1), r1=146(y1), r2=367(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 146
LDI r2, 367
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
