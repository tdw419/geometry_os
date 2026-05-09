; DESCRIPTION: Draws a magenta line from (275, 152) to (465, 207).
; PLAN: r0=275(x1), r1=152(y1), r2=465(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 152
LDI r2, 465
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
