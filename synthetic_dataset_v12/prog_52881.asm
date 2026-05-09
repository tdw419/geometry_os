; DESCRIPTION: Draws a white line from (178, 26) to (503, 187).
; PLAN: r0=178(x1), r1=26(y1), r2=503(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 26
LDI r2, 503
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
