; DESCRIPTION: Draws a white line from (154, 145) to (73, 56).
; PLAN: r0=154(x1), r1=145(y1), r2=73(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 145
LDI r2, 73
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
