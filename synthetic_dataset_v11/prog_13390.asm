; DESCRIPTION: Draws a red line from (207, 33) to (197, 191).
; PLAN: r0=207(x1), r1=33(y1), r2=197(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 33
LDI r2, 197
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
