; DESCRIPTION: Draws a white line from (232, 142) to (173, 177).
; PLAN: r0=232(x1), r1=142(y1), r2=173(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 142
LDI r2, 173
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
