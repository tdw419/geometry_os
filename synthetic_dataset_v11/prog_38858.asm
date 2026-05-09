; DESCRIPTION: Draws a white line from (117, 225) to (151, 241).
; PLAN: r0=117(x1), r1=225(y1), r2=151(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 225
LDI r2, 151
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
