; DESCRIPTION: Draws a black line from (395, 50) to (234, 210).
; PLAN: r0=395(x1), r1=50(y1), r2=234(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 50
LDI r2, 234
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
