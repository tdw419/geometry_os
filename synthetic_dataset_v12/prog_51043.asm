; DESCRIPTION: Draws a white line from (91, 30) to (157, 174).
; PLAN: r0=91(x1), r1=30(y1), r2=157(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 30
LDI r2, 157
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
