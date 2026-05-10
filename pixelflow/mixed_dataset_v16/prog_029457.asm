; DESCRIPTION: Draws a black line from (55, 96) to (295, 226).
; PLAN: r0=55(x1), r1=96(y1), r2=295(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 96
LDI r2, 295
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
