; DESCRIPTION: Draws a red line from (87, 143) to (125, 152).
; PLAN: r0=87(x1), r1=143(y1), r2=125(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 143
LDI r2, 125
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
