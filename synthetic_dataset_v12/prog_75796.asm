; DESCRIPTION: Draws a white line from (391, 187) to (40, 132).
; PLAN: r0=391(x1), r1=187(y1), r2=40(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 187
LDI r2, 40
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
