; DESCRIPTION: Draws a red line from (118, 8) to (220, 152).
; PLAN: r0=118(x1), r1=8(y1), r2=220(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 8
LDI r2, 220
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
