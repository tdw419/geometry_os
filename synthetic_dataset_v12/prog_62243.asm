; DESCRIPTION: Renders a white line between points (333, 250) and (387, 74).
; PLAN: r0=333(x1), r1=250(y1), r2=387(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 250
LDI r2, 387
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
