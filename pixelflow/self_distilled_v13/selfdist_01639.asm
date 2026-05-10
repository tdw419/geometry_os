; DESCRIPTION: Draws a white line from (50, 125) to (13, 98).
; PLAN: r0=50(x1), r1=125(y1), r2=13(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 125
LDI r2, 13
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
