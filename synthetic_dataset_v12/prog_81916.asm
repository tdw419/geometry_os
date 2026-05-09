; DESCRIPTION: Renders a white line between points (345, 59) and (308, 178).
; PLAN: r0=345(x1), r1=59(y1), r2=308(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 59
LDI r2, 308
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
