; DESCRIPTION: Draws a white line from (465, 99) to (457, 243).
; PLAN: r0=465(x1), r1=99(y1), r2=457(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 99
LDI r2, 457
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
