; DESCRIPTION: Draws a white line from (65, 221) to (112, 234).
; PLAN: r0=65(x1), r1=221(y1), r2=112(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 221
LDI r2, 112
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
