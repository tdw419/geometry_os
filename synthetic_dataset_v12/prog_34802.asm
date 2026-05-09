; DESCRIPTION: Renders a red line between points (365, 248) and (300, 146).
; PLAN: r0=365(x1), r1=248(y1), r2=300(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 248
LDI r2, 300
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
