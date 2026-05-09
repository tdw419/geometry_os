; DESCRIPTION: Renders a blue line between points (171, 124) and (217, 28).
; PLAN: r0=171(x1), r1=124(y1), r2=217(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 124
LDI r2, 217
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
