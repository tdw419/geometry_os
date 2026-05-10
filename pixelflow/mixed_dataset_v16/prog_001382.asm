; DESCRIPTION: Renders a red line between points (354, 96) and (272, 54).
; PLAN: r0=354(x1), r1=96(y1), r2=272(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 96
LDI r2, 272
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
