; DESCRIPTION: Renders a red line between points (465, 111) and (474, 162).
; PLAN: r0=465(x1), r1=111(y1), r2=474(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 111
LDI r2, 474
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
