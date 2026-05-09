; DESCRIPTION: Draws a black line from (143, 191) to (295, 84).
; PLAN: r0=143(x1), r1=191(y1), r2=295(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 191
LDI r2, 295
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
