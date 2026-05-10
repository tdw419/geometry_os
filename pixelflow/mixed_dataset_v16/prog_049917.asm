; DESCRIPTION: Draws a red line from (450, 220) to (441, 226).
; PLAN: r0=450(x1), r1=220(y1), r2=441(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 220
LDI r2, 441
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
