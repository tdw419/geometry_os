; DESCRIPTION: Renders a red line between points (444, 13) and (280, 143).
; PLAN: r0=444(x1), r1=13(y1), r2=280(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 13
LDI r2, 280
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
