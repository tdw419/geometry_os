; DESCRIPTION: Draws a red line from (108, 226) to (18, 220).
; PLAN: r0=108(x1), r1=226(y1), r2=18(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 226
LDI r2, 18
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
