; DESCRIPTION: Draws a magenta line from (465, 186) to (187, 96).
; PLAN: r0=465(x1), r1=186(y1), r2=187(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 186
LDI r2, 187
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
