; DESCRIPTION: Draws a red line from (33, 36) to (27, 191).
; PLAN: r0=33(x1), r1=36(y1), r2=27(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 36
LDI r2, 27
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
