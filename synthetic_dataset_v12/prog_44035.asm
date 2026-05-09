; DESCRIPTION: Draws a red line from (152, 11) to (79, 59).
; PLAN: r0=152(x1), r1=11(y1), r2=79(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 11
LDI r2, 79
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
