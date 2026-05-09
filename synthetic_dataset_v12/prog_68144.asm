; DESCRIPTION: Draws a red line from (492, 98) to (69, 22).
; PLAN: r0=492(x1), r1=98(y1), r2=69(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 98
LDI r2, 69
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
