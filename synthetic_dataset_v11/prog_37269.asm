; DESCRIPTION: Renders a white line between points (149, 202) and (82, 59).
; PLAN: r0=149(x1), r1=202(y1), r2=82(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 202
LDI r2, 82
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
