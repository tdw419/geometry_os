; DESCRIPTION: Draws a white line from (40, 61) to (146, 40).
; PLAN: r0=40(x1), r1=61(y1), r2=146(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 61
LDI r2, 146
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
