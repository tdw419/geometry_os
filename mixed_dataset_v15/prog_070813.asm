; DESCRIPTION: Draws a white line from (178, 148) to (370, 86).
; PLAN: r0=178(x1), r1=148(y1), r2=370(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 148
LDI r2, 370
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
