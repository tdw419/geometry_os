; DESCRIPTION: Draws a white line from (370, 105) to (391, 255).
; PLAN: r0=370(x1), r1=105(y1), r2=391(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 105
LDI r2, 391
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
