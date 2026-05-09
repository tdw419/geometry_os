; DESCRIPTION: Renders a red line between points (392, 61) and (509, 61).
; PLAN: r0=392(x1), r1=61(y1), r2=509(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 61
LDI r2, 509
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
