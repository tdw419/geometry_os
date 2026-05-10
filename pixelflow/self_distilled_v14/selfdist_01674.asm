; DESCRIPTION: Draws a red line from (372, 141) to (174, 117).
; PLAN: r0=372(x1), r1=141(y1), r2=174(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 141
LDI r2, 174
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
