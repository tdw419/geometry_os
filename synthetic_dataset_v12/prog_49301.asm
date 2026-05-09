; DESCRIPTION: Draws a white line from (107, 216) to (21, 108).
; PLAN: r0=107(x1), r1=216(y1), r2=21(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 216
LDI r2, 21
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
