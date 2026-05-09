; DESCRIPTION: Places a white line segment connecting (465, 166) to (278, 243).
; PLAN: r0=465(x1), r1=166(y1), r2=278(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 166
LDI r2, 278
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
