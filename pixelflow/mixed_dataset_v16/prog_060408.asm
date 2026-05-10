; DESCRIPTION: Draws a magenta line from (305, 162) to (370, 92).
; PLAN: r0=305(x1), r1=162(y1), r2=370(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 162
LDI r2, 370
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
