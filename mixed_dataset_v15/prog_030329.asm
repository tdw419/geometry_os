; DESCRIPTION: Draws a white line from (465, 77) to (360, 117).
; PLAN: r0=465(x1), r1=77(y1), r2=360(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 77
LDI r2, 360
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
