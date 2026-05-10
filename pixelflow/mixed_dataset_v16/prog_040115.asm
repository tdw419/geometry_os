; DESCRIPTION: Draws a white line from (17, 226) to (342, 93).
; PLAN: r0=17(x1), r1=226(y1), r2=342(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 226
LDI r2, 342
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
