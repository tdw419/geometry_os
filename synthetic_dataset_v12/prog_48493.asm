; DESCRIPTION: Draws a red line from (293, 186) to (440, 156).
; PLAN: r0=293(x1), r1=186(y1), r2=440(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 186
LDI r2, 440
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
