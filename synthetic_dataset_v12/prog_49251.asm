; DESCRIPTION: Draws a white line from (465, 222) to (9, 191).
; PLAN: r0=465(x1), r1=222(y1), r2=9(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 222
LDI r2, 9
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
