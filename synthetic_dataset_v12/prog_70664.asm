; DESCRIPTION: Draws a white line from (174, 50) to (61, 240).
; PLAN: r0=174(x1), r1=50(y1), r2=61(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 50
LDI r2, 61
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
