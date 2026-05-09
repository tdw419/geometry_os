; DESCRIPTION: Renders a yellow line between points (120, 47) and (79, 42).
; PLAN: r0=120(x1), r1=47(y1), r2=79(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 47
LDI r2, 79
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
