; DESCRIPTION: Renders a red line between points (73, 149) and (32, 150).
; PLAN: r0=73(x1), r1=149(y1), r2=32(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 149
LDI r2, 32
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
