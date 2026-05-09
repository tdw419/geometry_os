; DESCRIPTION: Renders a red line between points (454, 120) and (59, 113).
; PLAN: r0=454(x1), r1=120(y1), r2=59(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 120
LDI r2, 59
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
