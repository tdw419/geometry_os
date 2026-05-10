; DESCRIPTION: Renders a white line between points (305, 199) and (450, 96).
; PLAN: r0=305(x1), r1=199(y1), r2=450(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 199
LDI r2, 450
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
