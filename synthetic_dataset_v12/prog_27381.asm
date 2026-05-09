; DESCRIPTION: Draws a white line from (125, 53) to (164, 192).
; PLAN: r0=125(x1), r1=53(y1), r2=164(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 53
LDI r2, 164
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
