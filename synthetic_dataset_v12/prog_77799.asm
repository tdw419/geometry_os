; DESCRIPTION: Draws a white line from (65, 229) to (456, 226).
; PLAN: r0=65(x1), r1=229(y1), r2=456(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 229
LDI r2, 456
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
