; DESCRIPTION: Draws a white line from (199, 90) to (20, 29).
; PLAN: r0=199(x1), r1=90(y1), r2=20(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 90
LDI r2, 20
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
