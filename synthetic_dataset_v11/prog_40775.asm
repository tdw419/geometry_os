; DESCRIPTION: Draws a white line from (206, 57) to (148, 161).
; PLAN: r0=206(x1), r1=57(y1), r2=148(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 57
LDI r2, 148
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
