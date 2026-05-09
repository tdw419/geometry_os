; DESCRIPTION: Renders a white line between points (464, 49) and (475, 168).
; PLAN: r0=464(x1), r1=49(y1), r2=475(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 49
LDI r2, 475
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
