; DESCRIPTION: Draws a magenta line from (23, 72) to (487, 226).
; PLAN: r0=23(x1), r1=72(y1), r2=487(x2), r3=226(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 72
LDI r2, 487
LDI r3, 226
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
