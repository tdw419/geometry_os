; DESCRIPTION: Draws a white line from (39, 250) to (146, 229).
; PLAN: r0=39(x1), r1=250(y1), r2=146(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 250
LDI r2, 146
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
