; DESCRIPTION: Draws a magenta line from (504, 178) to (487, 35).
; PLAN: r0=504(x1), r1=178(y1), r2=487(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 178
LDI r2, 487
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
