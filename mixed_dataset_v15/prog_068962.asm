; DESCRIPTION: Draws a white line from (334, 120) to (330, 225).
; PLAN: r0=334(x1), r1=120(y1), r2=330(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 120
LDI r2, 330
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
