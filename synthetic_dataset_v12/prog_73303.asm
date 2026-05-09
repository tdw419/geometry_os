; DESCRIPTION: Draws a black line from (295, 252) to (138, 69).
; PLAN: r0=295(x1), r1=252(y1), r2=138(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 252
LDI r2, 138
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
