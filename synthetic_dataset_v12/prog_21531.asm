; DESCRIPTION: Draws a white line from (125, 96) to (189, 164).
; PLAN: r0=125(x1), r1=96(y1), r2=189(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 96
LDI r2, 189
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
