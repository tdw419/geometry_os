; DESCRIPTION: Draws a white line from (228, 113) to (125, 96).
; PLAN: r0=228(x1), r1=113(y1), r2=125(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 113
LDI r2, 125
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
