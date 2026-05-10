; DESCRIPTION: Draws a magenta line from (251, 236) to (410, 170).
; PLAN: r0=251(x1), r1=236(y1), r2=410(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 236
LDI r2, 410
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
