; DESCRIPTION: Draws a black line from (209, 180) to (25, 207).
; PLAN: r0=209(x1), r1=180(y1), r2=25(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 180
LDI r2, 25
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
