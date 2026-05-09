; DESCRIPTION: Draws a red line from (56, 117) to (361, 146).
; PLAN: r0=56(x1), r1=117(y1), r2=361(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 117
LDI r2, 361
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
