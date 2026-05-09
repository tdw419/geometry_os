; DESCRIPTION: Draws a black line from (450, 226) to (428, 182).
; PLAN: r0=450(x1), r1=226(y1), r2=428(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 226
LDI r2, 428
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
