; DESCRIPTION: Draws a white line from (55, 82) to (23, 91).
; PLAN: r0=55(x1), r1=82(y1), r2=23(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 82
LDI r2, 23
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
