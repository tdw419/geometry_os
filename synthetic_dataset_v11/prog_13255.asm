; DESCRIPTION: Draws a white line from (125, 195) to (207, 200).
; PLAN: r0=125(x1), r1=195(y1), r2=207(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 195
LDI r2, 207
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
