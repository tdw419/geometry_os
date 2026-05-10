; DESCRIPTION: Draws a white line from (193, 115) to (286, 83).
; PLAN: r0=193(x1), r1=115(y1), r2=286(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 115
LDI r2, 286
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
