; DESCRIPTION: Draws a black line from (137, 180) to (295, 178).
; PLAN: r0=137(x1), r1=180(y1), r2=295(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 180
LDI r2, 295
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
