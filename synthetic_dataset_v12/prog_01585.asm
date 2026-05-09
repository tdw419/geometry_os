; DESCRIPTION: Renders a white line between points (171, 50) and (447, 175).
; PLAN: r0=171(x1), r1=50(y1), r2=447(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 50
LDI r2, 447
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
