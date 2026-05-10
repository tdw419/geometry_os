; DESCRIPTION: Draws a red line from (91, 96) to (293, 50).
; PLAN: r0=91(x1), r1=96(y1), r2=293(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 96
LDI r2, 293
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
