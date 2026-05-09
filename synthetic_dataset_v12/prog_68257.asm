; DESCRIPTION: Draws a black line from (238, 205) to (499, 68).
; PLAN: r0=238(x1), r1=205(y1), r2=499(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 205
LDI r2, 499
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
