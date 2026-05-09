; DESCRIPTION: Renders a white line between points (146, 19) and (152, 59).
; PLAN: r0=146(x1), r1=19(y1), r2=152(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 19
LDI r2, 152
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
