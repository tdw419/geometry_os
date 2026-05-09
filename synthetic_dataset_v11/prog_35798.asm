; DESCRIPTION: Draws a red line from (245, 93) to (176, 156).
; PLAN: r0=245(x1), r1=93(y1), r2=176(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 93
LDI r2, 176
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
