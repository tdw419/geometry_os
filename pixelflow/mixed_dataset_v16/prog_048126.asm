; DESCRIPTION: Renders a red line between points (392, 72) and (82, 38).
; PLAN: r0=392(x1), r1=72(y1), r2=82(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 72
LDI r2, 82
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
