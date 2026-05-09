; DESCRIPTION: Draws a green line from (465, 7) to (174, 75).
; PLAN: r0=465(x1), r1=7(y1), r2=174(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 7
LDI r2, 174
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
