; DESCRIPTION: Draws a red line from (2, 185) to (213, 210).
; PLAN: r0=2(x1), r1=185(y1), r2=213(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 185
LDI r2, 213
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
