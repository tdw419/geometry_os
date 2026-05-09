; DESCRIPTION: Draws a white line from (291, 15) to (175, 54).
; PLAN: r0=291(x1), r1=15(y1), r2=175(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 15
LDI r2, 175
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
