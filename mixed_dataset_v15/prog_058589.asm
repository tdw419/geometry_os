; DESCRIPTION: Draws a black line from (208, 16) to (108, 239).
; PLAN: r0=208(x1), r1=16(y1), r2=108(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 16
LDI r2, 108
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
