; DESCRIPTION: Draws a red line from (106, 124) to (290, 152).
; PLAN: r0=106(x1), r1=124(y1), r2=290(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 124
LDI r2, 290
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
