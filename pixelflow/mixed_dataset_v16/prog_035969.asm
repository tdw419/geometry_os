; DESCRIPTION: Draws a blue line from (352, 2) to (268, 249).
; PLAN: r0=352(x1), r1=2(y1), r2=268(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 2
LDI r2, 268
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
