; DESCRIPTION: Draws a white line from (79, 161) to (73, 27).
; PLAN: r0=79(x1), r1=161(y1), r2=73(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 161
LDI r2, 73
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
