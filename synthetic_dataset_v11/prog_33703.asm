; DESCRIPTION: Draws a white line from (14, 217) to (242, 9).
; PLAN: r0=14(x1), r1=217(y1), r2=242(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 217
LDI r2, 242
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
