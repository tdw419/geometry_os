; DESCRIPTION: Renders a red line between points (146, 62) and (305, 63).
; PLAN: r0=146(x1), r1=62(y1), r2=305(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 62
LDI r2, 305
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
