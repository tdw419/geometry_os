; DESCRIPTION: Draws a red line from (368, 168) to (83, 32).
; PLAN: r0=368(x1), r1=168(y1), r2=83(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 168
LDI r2, 83
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
